import AVFoundation

@MainActor
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
            print("Error creating AVAssetWriter: \(error)")
            return
        }
        
        let audioSettings: [String: Any] = [
            AVFormatIDKey: kAudioFormatLinearPCM,
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVLinearPCMBitDepthKey: 16,
            AVLinearPCMIsNonInterleaved: false,
            AVLinearPCMIsFloatKey: false,
            AVLinearPCMIsBigEndianKey: false, // 이 부분이 추가되었습니다.
        ]
        
        assetWriterInput = AVAssetWriterInput(mediaType: .audio, outputSettings: audioSettings)
        assetWriterInput.expectsMediaDataInRealTime = true
        
        if assetWriter.canAdd(assetWriterInput) {
            assetWriter.add(assetWriterInput)
        } else {
            print("Cannot add AVAssetWriterInput to AVAssetWriter")
            return
        }
        
        // 캡처 세션 시작
        captureSession!.startRunning()
        
        // AVAssetWriter 시작
        assetWriter.startWriting()
        assetWriter.startSession(atSourceTime: CMTime.zero)
        
        isRecording = true
    }

    func stopRecording() {
        isRecording = false
        
        // 캡처 세션 정지
        // 캡처 세션을 정지하기 전에, delegate 메소드가 호출되는 것을 방지하기 위해 데이터 출력을 제거합니다.
        print("audioDataOutput:", audioDataOutput)
        audioDataOutput.setSampleBufferDelegate(nil, queue: nil)
        // 캡처 세션을 정지합니다.
        captureSession!.stopRunning()
        
        // AVAssetWriter 종료
        assetWriterInput.markAsFinished()
        assetWriter.finishWriting {
            print("Recording finished.")
        }
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
