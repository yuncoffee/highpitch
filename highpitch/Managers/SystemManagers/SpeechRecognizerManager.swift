//
//  SpeechRecognizerManager.swift
//  highpitch
//
//  Created by yuncoffee on 10/13/23.
//

import Foundation
import Speech
import SwiftUI

/// Speech 프레임워크와 관련된 동작을 담당하는 매니저 클래스
@Observable
final class SpeechRecognizerManager {
    // MARK: Properties
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko_KR"))!
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    
    private var urlRecognitionRequest: SFSpeechURLRecognitionRequest?
    
    private var recognitionTask: SFSpeechRecognitionTask?
    
    private let audioEngine = AVAudioEngine()
    
    // MARK: default value
    /// 실시간 말 빠르기
    public var realTimeRate = 300.0
    /// 실시간 습관어 횟수
    public var realTimeFillerCount = 0
    /// 실시간 말 빠르기 정도
    public var flagCount = 0
    
    private var rateContainer: [[Double]] = []
    private var prevFillerCount = 0
    private var startFillerCount = 0
    private var prevTime: TimeInterval?
    
    private var startAt = 0.0
    private var endAt = 0.0
    private var message = ""
    private var isFinal = false
    
    // swiftlint: disable function_body_length
    // swiftlint: disable cyclomatic_complexity
    func startanalysis() throws {
        // Cancel the previous task if it's running.
        if let recognitionTask = recognitionTask {
            recognitionTask.cancel()
            self.recognitionTask = nil
        }
        
        // Configure the audio session for the app.
        let inputNode = audioEngine.inputNode

        // Create and configure the speech recognition request.
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest
        else { fatalError("Unable to created a SFSpeechAudioBufferRecognitionRequest object") }
        recognitionRequest.shouldReportPartialResults = true
        recognitionRequest.addsPunctuation = true
        
        // Keep speech recognition data on device
        recognitionRequest.requiresOnDeviceRecognition = true
        
        // Create a recognition task for the speech recognition session.
        // Keep a reference to the task so that it can be canceled.
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
            // MARK: - speaking rate
            let currentTime = CACurrentMediaTime()
            /// deque를 관리합니다.
            self.rateContainer.reverse()
            while !self.rateContainer.isEmpty
                    && (Double(currentTime) - self.rateContainer.last!.first! > 2.0) {
                _ = self.rateContainer.popLast()
            }
            self.rateContainer.reverse()
            /// [현재 시각, 음절 수]를 추가합니다.
            self.rateContainer.append([
                Double(currentTime),
                Double(result?.bestTranscription.formattedString
                    .components(separatedBy: [" "]).joined().count ?? 0)
            ])
            let answer = (self.rateContainer.last!.last! - self.rateContainer.first!.last!)
            / (self.rateContainer.last!.first! - self.rateContainer.first!.first!) * 60
            /// 값이 정상적이라면 최신화합니다.
            if let result = result {
                if result.speechRecognitionMetadata == nil {
                    if answer < 700 && answer > 0 {
                        self.realTimeRate = answer
                        /// flagCount를 관리합니다.
                        if self.realTimeRate > 500 {
                            self.flagCount += 1
                            self.flagCount = max(self.flagCount, 1)
                        } else if self.realTimeRate < 200 {
                            self.flagCount -= 1
                            self.flagCount = min(self.flagCount, -1)
                        } else {
                            self.flagCount = 0
                        }
                    }
                }
            }
            print("flagCount: ", self.flagCount)
            print("실시간 말빠르기: ", self.realTimeRate)
            // MARK: - filler word
            /// buffer가 초기화된다면 문장을 새로 시작합니다.
            if let result = result, result.speechRecognitionMetadata != nil {
                self.startFillerCount = 0
                self.prevFillerCount = 0
            } else {
                /// temp: 습관어 횟수
                var temp = 0
                if let result = result {
                    for word in result.bestTranscription.formattedString.components(separatedBy: [" "]) {
                        for fillerWord in FillerWordList.userFillerWordList
                        where word == fillerWord { temp += 1}
                    }
                }
                /// prevTime과 currentTime의 차이가 0.6을 넘는다면 문장을 새로 시작합니다.
                if let prevTime = self.prevTime {
                    if (currentTime - prevTime) > 0.6 {
                        self.startFillerCount = self.prevFillerCount
                    }
                }
                if (temp - self.startFillerCount >= 0) {
                    self.realTimeFillerCount = temp - self.startFillerCount
                }
                self.prevFillerCount = temp
                self.prevTime = currentTime
            }
            print("실시간 습관어 횟수: ", self.realTimeFillerCount)
            // MARK: - 나머지
            var isFinal = false
            if let result = result {
                print(result.bestTranscription.formattedString)
                isFinal = result.isFinal
            }
            
            if error != nil || isFinal {
                // Stop recognizing speech if there is a problem.
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
            }
        }

        // swiftlint: disable line_length
        // Configure the microphone input.
        let recordingFormat = inputNode.outputFormat(forBus:0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, _: AVAudioTime) in
            
            self.recognitionRequest?.append(buffer)
        }
        // swiftlint: enable line_length
        audioEngine.prepare()
        try audioEngine.start()
    }
    // swiftlint: enable function_body_length
    // swiftlint: enable cyclomatic_complexity
    
    func stopRecording() {
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
        }
    }
    
    func startRecording() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            // Divert to the app's main thread so that the UI
            // can be updated.
            switch authStatus {
            case .authorized:
                do {
                    try self.startanalysis()
                } catch { }
                print("autorized with speech recognition")
            case .denied:
                print("access denied")
            case .restricted:
                print("access denied")
            case .notDetermined:
                print("access denied")
            default:
                print("access denied")
            }
        }
    }
    
    func startFileRecognition(url: URL) async -> [UtteranceModel] {
        var answer: [UtteranceModel] = []
        SFSpeechRecognizer.requestAuthorization { authStatus in
            // Divert to the app's main thread so that the UI
            // can be updated.
            if authStatus == .authorized {
                print("authorized with speech recognition")
                // Cancel the previous task if it's running.
                if let recognitionTask = self.recognitionTask {
                    recognitionTask.cancel()
                    self.recognitionTask = nil
                }
                
                // Create and configure the speech recognition request.
                self.urlRecognitionRequest = SFSpeechURLRecognitionRequest(url: url)
                guard let recognitionRequest = self.urlRecognitionRequest
                else { fatalError("Unable to created a SFSpeechAudioBufferRecognitionRequest object") }
                recognitionRequest.shouldReportPartialResults = false
                recognitionRequest.addsPunctuation = true
                
                // Keep speech recognition data on device
                recognitionRequest.requiresOnDeviceRecognition = true
                
                // Create a recognition task for the speech recognition session.
                // Keep a reference to the task so that it can be canceled.
                self.recognitionTask
                = self.speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
                    if let result = result {
                        for word in result.bestTranscription.segments {
                            /// 지난 단어와 간격이 0.4초 이상이거나 마지막 단어라면 UtteranceModel을 추가합니다.
                            if (word.timestamp - self.endAt > 0.5)
                                || (result.isFinal) {
                                if self.message != "" {
                                    self.message += "."
                                    print(Int(self.startAt * 1000), Int((self.endAt - self.startAt) * 1000), self.message)
                                    answer.append(UtteranceModel(
                                        startAt: Int(self.startAt * 1000),
                                        duration: Int((self.endAt - self.startAt) * 1000),
                                        message: self.message
                                    ))
                                }
                                self.startAt = word.timestamp
                                self.message = word.substring
                            } else if (word.substring != "") {
                                self.message += " "; self.message += word.substring
                            }
                            self.endAt = word.timestamp + word.duration
                        }
                        if result.isFinal { self.isFinal = true }
                        
                    }
                    if error != nil {
                        self.recognitionRequest = nil
                        self.recognitionTask = nil
                    }
                }
            } else {
                self.isFinal = true
                print("access denied")
            }
        }
        while(!isFinal) {
            do {
                try await Task.sleep(nanoseconds: 100_000_000)
            } catch {
                print("task.sleep 오류")
            }
        }
        return answer
    }
}
