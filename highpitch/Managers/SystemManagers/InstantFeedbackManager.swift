//
//  PanelData.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

enum InstantPanel: CaseIterable {
    case setting
    case detailSetting
    case timer
    case speed
    case fillerWord
}

@Observable
final class InstantFeedbackManager {
    var isDetailSettingActive = false
    var focusedPanel: InstantPanel?
    var activePanels: Set<InstantPanel> = []
    var speechRecognizerManager: SpeechRecognizerManager?
    var feedbackPanelControllers: [InstantPanel:PanelController] = [:]
    
    // Panel들의 위치
    var timerPanelX = UserDefaults.standard.string(forKey: "TimerPanelX").flatMap { Int($0) } ?? 48
    var timerPanelY = UserDefaults.standard.string(forKey: "TimerPanelY").flatMap { Int($0) } ?? Int((NSScreen.main?.visibleFrame.height)!) - 56
    var speedPanelX = UserDefaults.standard.string(forKey: "SpeedPanelX").flatMap { Int($0) } ?? Int((NSScreen.main?.visibleFrame.width)!) - 178
    var speedPanelY = UserDefaults.standard.string(forKey: "SpeedPanelY").flatMap { Int($0) } ?? 276
    var fillerWordPanelX = UserDefaults.standard.string(forKey: "FillerWordPanelX").flatMap { Int($0) } ?? Int((NSScreen.main?.visibleFrame.width)!) - 178
    var fillerWordPanelY = UserDefaults.standard.string(forKey: "FillerWordPanelY").flatMap { Int($0) } ?? 129
    var detailPanelX = UserDefaults.standard.string(forKey: "DetailPanelX").flatMap { Int($0) } ?? 56
    var detailPanelY = UserDefaults.standard.string(forKey: "DetailPanelY").flatMap { Int($0) } ?? 116
    
    // Panel들의 가로세로 길이
    
}

extension InstantFeedbackManager {
    func removeActivePanel(panel: InstantPanel) {
        activePanels.remove(panel)
    }
    func removeAllActivePanel() {
        activePanels.removeAll()
    }
}
