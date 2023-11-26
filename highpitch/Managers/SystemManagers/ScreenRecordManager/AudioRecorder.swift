import AVFoundation

class AudioRecorder: NSObject, AVCaptureAudioDataOutputSampleBufferDelegate {
    var audioDataOutput: AVCaptureAudioDataOutput!
    var assetWriter: AVAssetWriter!
    var assetWriterInput: AVAssetWriterInput!
    var isRecording = false
    var captureSession: AVCaptureSession?

    func startRecording(filename: String) {
        // AVCaptureSession 설정
        captureSession = AVCaptureSession()
        guard let audioDevice = AVCaptureDevice.default(for: .audio),
              let audioInput = try? AVCaptureDeviceInput(device: audioDevice) else {
            return
        }
        
        if captureSession!.canAddInput(audioInput) {
            captureSession!.addInput(audioInput)
        }
        
        audioDataOutput = AVCaptureAudioDataOutput()
        if captureSession!.canAddOutput(audioDataOutput) {
            captureSession!.addOutput(audioDataOutput)
        }
        
        // AVCaptureAudioDataOutputSampleBufferDelegate 설정
        let queue = DispatchQueue(label: "audioQueue")
        audioDataOutput.setSampleBufferDelegate(self, queue: queue)
        
        // AVAssetWriter 설정
        let outputFileURL = URL.getPath(fileName: filename, type: .audio)
        
        do {
            assetWriter = try AVAssetWriter(outputURL: outputFileURL, fileType: .m4a)
        } catch {
            #if DEBUG
            print("Error creating AVAssetWriter: \(error)")
            #endif
            return
        }
        
        let audioSettings: [String: Any] = [
            AVFormatIDKey: kAudioFormatLinearPCM,
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVLinearPCMBitDepthKey: 16,
            AVLinearPCMIsNonInterleaved: false,
            AVLinearPCMIsFloatKey: false,
            AVLinearPCMIsBigEndianKey: false
        ]
        
        assetWriterInput = AVAssetWriterInput(mediaType: .audio, outputSettings: audioSettings)
        assetWriterInput.expectsMediaDataInRealTime = true
        
        if assetWriter.canAdd(assetWriterInput) {
            assetWriter.add(assetWriterInput)
        } else {
            #if DEBUG
            print("Cannot add AVAssetWriterInput to AVAssetWriter")
            #endif
            return
        }
        
        // 캡처 세션 시작
        captureSession!.startRunning()
        
        // AVAssetWriter 시작
        assetWriter.startWriting()
        assetWriter.startSession(atSourceTime: CMTime.zero)
        
        isRecording = true
        // TimerPanel의 타이머 시작
        SystemManager.shared.instantFeedbackManager.isTimerRunning = 1
    }

    func stopRecording() {
        isRecording = false
        audioDataOutput.setSampleBufferDelegate(nil, queue: nil)
        captureSession!.stopRunning()
        assetWriterInput.markAsFinished()
        assetWriter.finishWriting {
            #if DEBUG
            print("Recording finished.")
            #endif
        }
        // TimerPanel의 타이머 정지
        SystemManager.shared.instantFeedbackManager.isTimerRunning = 0
    }

    // AVCaptureAudioDataOutputSampleBufferDelegate 메소드 구현
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if isRecording {
            if assetWriterInput.isReadyForMoreMediaData {
                assetWriterInput.append(sampleBuffer)
            }
        }
    }
}
extension AudioRecorder {
    func mergeAudioAndVideo(videoURL: URL, audioURL: URL, outputURL: URL, completion: @escaping (Error?) -> Void) {
        // 비디오 트랙 생성
        let videoAsset = AVURLAsset(url: videoURL)
        let videoTrack = videoAsset.tracks(withMediaType: .video)[0]

        // 오디오 트랙 생성
        let audioAsset = AVURLAsset(url: audioURL)
        let audioTrack = audioAsset.tracks(withMediaType: .audio)[0]

        // 합치기 위한 Composition 생성
        let mixComposition = AVMutableComposition()

        // 비디오 트랙 추가
        let compositionVideoTrack = mixComposition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)
        try? compositionVideoTrack?.insertTimeRange(CMTimeRangeMake(start: CMTime.zero, duration: videoAsset.duration), of: videoTrack, at: CMTime.zero)

        // 오디오 트랙 추가
        let compositionAudioTrack = mixComposition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
        try? compositionAudioTrack?.insertTimeRange(CMTimeRangeMake(start: CMTime.zero, duration: videoAsset.duration), of: audioTrack, at: CMTime.zero)

        // 출력 설정
        let exportSession = AVAssetExportSession(asset: mixComposition, presetName: AVAssetExportPresetHighestQuality)
        exportSession?.outputURL = outputURL
        exportSession?.outputFileType = .mov

        // 비동기적으로 합치기 실행
        exportSession?.exportAsynchronously {
            completion(exportSession?.error)
        }
    }
}
