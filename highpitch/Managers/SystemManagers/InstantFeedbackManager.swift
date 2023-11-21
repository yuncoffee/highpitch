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
    case record
    case save
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
    
    typealias PanelFrameInfo = (
        size: CGSize,
        topLeftPoint: CGPoint?,
        bottomRightPoint: CGPoint?
    )
    
    // (Panel들의 가로세로 길이) + (NSScreen과 Panel이 떨어진 거리)
    let TIMER_PANEL_INFO: PanelFrameInfo = (
        size: CGSize(width: 108.0, height: 56.0),
        topLeftPoint: CGPoint(x: 48, y: 56),
        bottomRightPoint: nil
    )
    let SETTING_PANEL_INFO: PanelFrameInfo = (
        size: CGSize(width: 44.0, height: 28.0),
        topLeftPoint: CGPoint(x: 0, y: 77),
        bottomRightPoint: CGPoint(x:64, y:0)
    )
    let SPEED_PANEL_INFO: PanelFrameInfo = (
        size: CGSize(width: 120.0, height: 120.0),
        topLeftPoint: nil,
        bottomRightPoint: CGPoint(x: 75, y: 261)
    )
    let FILLERWORD_PANEL_INFO: PanelFrameInfo = (
        size: CGSize(width: 120.0, height: 120.0),
        topLeftPoint: nil,
        bottomRightPoint: CGPoint(x: 75, y: 125)
    )
    let EDIT_PANEL_INFO: PanelFrameInfo = (
        size: CGSize(width: 240, height: 229),
        topLeftPoint: CGPoint(x: 0, y: 105),
        bottomRightPoint: CGPoint(x: 64, y: 0)
    )
    let RECORD_PANEL_INFO: PanelFrameInfo = (
        size: CGSize(width: 357.0, height: 29.0),
        topLeftPoint: CGPoint(x: 0, y: 38),
        bottomRightPoint: nil
    )
    let SAVE_PANEL_INFO: PanelFrameInfo = (
        size: CGSize(width: 420.0, height: 280.0),
        topLeftPoint: nil,
        bottomRightPoint: nil
    )
    
    // Panel 우상단에 뜨는 x버튼의 크기
    let PANEL_XMARK_RADIUS: CGFloat = 12
    let PANEL_XMARK_CIRCLE_WIDTH: CGFloat = 2
    
    // SettingPanel Hover시 뜨는 문구창 크기
    let SETTING_PANEL_HOVER_MSG_WIDTH: CGFloat = 116
    let SETTING_PANEL_HOVER_MSG_HEIGHT: CGFloat = 23
    let SETTING_PANEL_DISTANCE: CGFloat = 12
    
}

extension InstantFeedbackManager {
    func removeActivePanel(panel: InstantPanel) {
        activePanels.remove(panel)
    }
    
    func removeAllActivePanel() {
        activePanels.removeAll()
    }
    
    func getPanelPositionX(left: CGFloat, padding: CGFloat) -> Int {
        return Int(left - padding)
    }
    
    func getPanelPositionX(right: CGFloat, width: CGFloat, padding: CGFloat?) -> Int {
        return Int(NSScreen.screens[0].frame.width - (right + width + (padding ?? 0)))
    }
    
    func getPanelPositionY(top: CGFloat, height: CGFloat, padding: CGFloat?) -> Int {
        return Int(NSScreen.screens[0].frame.height - (top + height + (padding ?? 0)))
    }
    
    func getPanelPositionY(bottom: CGFloat, padding: CGFloat) -> Int {
        return Int(bottom - padding)
    }
    
    func getTotalFrameWidth(width: CGFloat, padding: CGFloat) -> Int {
        return Int(width + padding * 2)
    }
    
    func getTotalFrameHeight(height: CGFloat, padding: CGFloat) -> Int {
        return Int(height + padding * 2)
    }
    
    func getTotalFrameWidth(width: CGFloat, padding: CGFloat) -> CGFloat {
        return width + padding * 2
    }
    
    func getTotalFrameHeight(height: CGFloat, padding: CGFloat) -> CGFloat {
        return height + padding * 2
    }
    
}
