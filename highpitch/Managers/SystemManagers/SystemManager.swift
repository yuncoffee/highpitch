//
//  SystemManager.swift
//  highpitch
//
//  Created by yuncoffee on 11/2/23.
//

import Foundation
import SwiftUI
import HotKey
import AppKit

@Observable
final class SystemManager {
    private init() {}
    static let shared = SystemManager()
    
    let instantFeedbackManager = InstantFeedbackManager()
    
    let ONBOARDING_TESTONE_FILE_NAME = "onboarding_1"
    let ONBOARDING_TESTTWO_FILE_NAME = "onboarding_2"
    var testSPMs = [356.7, 356.7]
    
    var spmAverage: Double = UserDefaults.standard.double(forKey: "spmAverage")
    var isDarkMode = false
    var isAnalyzing = false
    var hasUnVisited = false
    var isRequsetAudioPermissionPopoverActive = false
    /// 음성 인식 중인지 저장합니다.
    var isRecognizing = false
    var isMainWindowPracticeSaveSheetActive = false
    var recordStartCommand: String = 
        UserDefaults.standard.string(forKey: "recordStartCommand") ?? "Command + Control + P"
    var recordPauseCommand: String =
        UserDefaults.standard.string(forKey: "recordPauseCommand") ?? "Command + Control + Space"
    var recordSaveCommand: String = 
        UserDefaults.standard.string(forKey: "recordSaveCommand") ?? "Command + Control + Esc"
    
    var hotkeyStart = HotKey(key: .p, modifiers: [.command, .control])
    var hotkeyPause = HotKey(key: .space, modifiers: [.command, .control])
    var hotkeySave = HotKey(key: .escape, modifiers: [.command, .control])
    
    // MARK: - onBoarding을 봤는지 확인하는 뷰
    var isPassOnbarding: Bool = UserDefaults.standard.bool(forKey: "isPassOnbarding")
    
    private var timer: Timer?

    func startInstantFeedback() {
        if !isRecognizing {
            instantFeedbackManager.activePanels.insert(InstantPanel.timer)
            instantFeedbackManager.activePanels.insert(InstantPanel.setting)
            instantFeedbackManager.activePanels.insert(InstantPanel.speed)
            instantFeedbackManager.activePanels.insert(InstantPanel.fillerWord)
            instantFeedbackManager.activePanels.insert(InstantPanel.record)
            self.instantFeedbackManager.speechRecognizerManager = SpeechRecognizerManager()
            self.instantFeedbackManager.speechRecognizerManager?.startRecording()
            isRecognizing.toggle()
        }
        timer = Timer.scheduledTimer(withTimeInterval: 120, repeats: true) { _ in
            #if DEBUG
            print("실시간 STT 다시 시작되었습니다.")
            #endif
            self.instantFeedbackManager.speechRecognizerManager?.stopRecording()
            self.instantFeedbackManager.speechRecognizerManager = nil
            self.instantFeedbackManager.speechRecognizerManager = SpeechRecognizerManager()
            self.instantFeedbackManager.speechRecognizerManager?.startRecording()
        }
    }
    
    func stopInstantFeedback() {
        if (isRecognizing) {
            timer?.invalidate()
            instantFeedbackManager.speechRecognizerManager?.stopRecording()
            instantFeedbackManager.speechRecognizerManager = nil
            instantFeedbackManager.activePanels.removeAll()
            instantFeedbackManager.feedbackPanelControllers[.save]?.hidePanel(self)
            instantFeedbackManager.feedbackPanelControllers[.detailSetting]?.hidePanel(self)
            isRecognizing.toggle()
        }
    }
    
    // MARK: 함수 테스트
    var playPractice: () -> Void = {}
    var pausePractice: () -> Void = {}
    var stopPractice: () -> Void = {}
    var notSavePractice: () -> Void = {}
}
