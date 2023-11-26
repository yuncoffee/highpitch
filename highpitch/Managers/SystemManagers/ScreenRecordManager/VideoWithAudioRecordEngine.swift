import SwiftUI
import AVFoundation


class CaptureManager: NSObject, AVCaptureFileOutputRecordingDelegate {
    private var captureSession: AVCaptureSession?
    private var movieOutput: AVCaptureMovieFileOutput?
    private var audioEngine = AVAudioEngine()
    private var audioFile: AVAudioFile?

    override init() {
        super.init()
        setupCaptureSession()
        setupAudioRecording()
    }

    private func setupCaptureSession() {
        captureSession = AVCaptureSession()

        guard let captureSession = captureSession else { return }

        // 비디오 입력 설정
        if let screenInput = AVCaptureScreenInput(displayID: CGMainDisplayID()) {
            if captureSession.canAddInput(screenInput) {
                captureSession.addInput(screenInput)
            }
        }

        // 오디오 입력 설정
        if let audioInput = try? AVCaptureDeviceInput(device: AVCaptureDevice.default(for: .audio)!) {
            if captureSession.canAddInput(audioInput) {
                captureSession.addInput(audioInput)
            }
        }

        // 비디오 출력 설정
        movieOutput = AVCaptureMovieFileOutput()
        if let movieOutput = movieOutput, captureSession.canAddOutput(movieOutput) {
            captureSession.addOutput(movieOutput)
        }
    }

    private func setupAudioRecording() {
        do {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let audioURL = documentsURL.appendingPathComponent("audio.wav")

            let audioFormat = AVAudioFormat(commonFormat: .pcmFormatInt16, sampleRate: 44100, channels: 2, interleaved: true)
            audioFile = try AVAudioFile(forWriting: audioURL, settings: audioFormat?.settings ?? [:])

            let inputNode = audioEngine.inputNode
            inputNode.installTap(onBus: 0, bufferSize: 1024, format: inputNode.inputFormat(forBus: 0)) { buffer, time in
                try? self.audioFile?.write(from: buffer)
            }

            audioEngine.prepare()
            try audioEngine.start()
        } catch {
            #if DEBUG
            print("Error setting up audio recording: \(error.localizedDescription)")
            #endif
        }
    }

    func startCapture() {
        guard let captureSession = captureSession else { return }

        if !captureSession.isRunning {
            captureSession.startRunning()
        }

        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let outputFileURL = documentsURL.appendingPathComponent("output.mov")

        movieOutput?.startRecording(to: outputFileURL, recordingDelegate: self)
    }

    func stopCapture() {
        movieOutput?.stopRecording()

        if let captureSession = captureSession, captureSession.isRunning {
            captureSession.stopRunning()
        }

        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        //audioFile?.
    }

    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        #if DEBUG
        print("Recording started")
        #endif
        
    }

    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let error = error {
            #if DEBUG
            print("Recording failed: \(error.localizedDescription)")
            #endif
        } else {
            #if DEBUG
            print("Recording finished: \(outputFileURL)")
            #endif
        }
    }
}
