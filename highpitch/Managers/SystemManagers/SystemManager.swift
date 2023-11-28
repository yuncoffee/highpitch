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
    var testSPMs = [300.0, 300.0]
    
    var spmAverage: Double {
        (testSPMs[0] + testSPMs[1]) / 2
    }
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

    func startInstantFeedback() {
        if !isRecognizing {
            instantFeedbackManager.speechRecognizerManager = SpeechRecognizerManager()
            instantFeedbackManager.speechRecognizerManager?.startRecording()
            instantFeedbackManager.activePanels.insert(InstantPanel.timer)
            instantFeedbackManager.activePanels.insert(InstantPanel.setting)
            instantFeedbackManager.activePanels.insert(InstantPanel.speed)
            instantFeedbackManager.activePanels.insert(InstantPanel.fillerWord)
            instantFeedbackManager.activePanels.insert(InstantPanel.record)
            isRecognizing.toggle()
        }
    }
    
    func stopInstantFeedback() {
        if (isRecognizing) {
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
}
