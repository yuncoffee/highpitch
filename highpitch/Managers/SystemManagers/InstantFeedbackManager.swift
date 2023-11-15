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
    var isEditMode = false
    var isDetailSettingActive = false
    var isFocused: InstantPanel?
    var activePanels: Set<InstantPanel> = []
    var speechRecognizerManager: SpeechRecognizerManager?
}

extension InstantFeedbackManager {
    func removeActivePanel(panel: InstantPanel) {
        activePanels.remove(panel)
    }
    func removeAllActivePanel() {
        activePanels.removeAll()
    }
}
