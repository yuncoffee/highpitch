//
//  AppDelegate.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

// MARK: 항상 맨 위에 떠 있는 뷰 (NSPanel)을 추가하기 위한 코드들
class AppDelegate: NSObject, NSApplicationDelegate {
    var instantFeedbackManager = SystemManager.shared.instantFeedbackManager
    var panelControllers: [InstantPanel:PanelController] = [:]
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // 타이머 패널
        timerPanelControllerSetting()
        
        // 세팅 패널
        settingPanelControllerSetting()
        
        // 스피드 패널
        speedPanelControllerSetting()
        
        // 필러워드 패널
        fillerWordPanelControllerSetting()
        
        // 편집 패널
        editPanelControllerSetting()
        
        // 연습 기록 패널
        recordPanelControllerSetting()
        
        // 연습 저장 패널
        savePanelControllerSetting()
        
        // InstantFeedbackManager에 Controllers 저장
        instantFeedbackManager.feedbackPanelControllers = panelControllers
    }
    
    func timerPanelControllerSetting() {
        let TIMER_PANEL_INFO = instantFeedbackManager.TIMER_PANEL_INFO
        let XMARK_RADIUS = instantFeedbackManager.PANEL_XMARK_RADIUS
        
        let originalXpos = instantFeedbackManager.getPanelPositionX(
            left: TIMER_PANEL_INFO.topLeftPoint!.x,
            padding: XMARK_RADIUS
        )
        let originalYpos = instantFeedbackManager.getPanelPositionY(
            top: TIMER_PANEL_INFO.topLeftPoint!.y,
            height: TIMER_PANEL_INFO.size.height,
            padding: XMARK_RADIUS
        )
        
        let xpos = loadPanelPosition(
            key: "TimerPanelX",
            originalPos: originalXpos
        )
        let ypos = loadPanelPosition(
            key: "TimerPanelY",
            originalPos: originalYpos
        )
        
        instantFeedbackManager.standardPanelPosition[0] = UserDefaults.standard.integer(forKey: "TimerPanelX")
        instantFeedbackManager.standardPanelPosition[1] = UserDefaults.standard.integer(forKey: "TimerPanelY")
        
        let timerPanelController = PanelController(
            xpos: xpos,
            ypos: ypos,
            width:
                instantFeedbackManager.getTotalFrameWidth(
                    width: TIMER_PANEL_INFO.size.width,
                    padding: XMARK_RADIUS
                ),
            height:
                instantFeedbackManager.getTotalFrameHeight(
                    height: TIMER_PANEL_INFO.size.height,
                    padding: XMARK_RADIUS
                )
        )
        panelControllers[InstantPanel.timer] = timerPanelController
        
        instantFeedbackManager.userDefaultsPanelPosition[0] = Int(timerPanelController.panel?.frame.origin.x ?? 0)
        instantFeedbackManager.userDefaultsPanelPosition[1] = Int(timerPanelController.panel?.frame.origin.y ?? 0)
        
        timerPanelController.panel?.contentView = NSHostingView(
            rootView: TimerPanelView(panelController: timerPanelController)
        )
        timerPanelController.hidePanel(self)
    }
    
    func settingPanelControllerSetting() {
        let SETTING_PANEL_INFO = instantFeedbackManager.SETTING_PANEL_INFO
        let MSG_WIDTH = instantFeedbackManager.SETTING_PANEL_HOVER_MSG_WIDTH
        let MSG_HEIGHT = instantFeedbackManager.SETTING_PANEL_HOVER_MSG_HEIGHT
        let MSG_DISTANCE = instantFeedbackManager.SETTING_PANEL_DISTANCE
        
        let settingPanelController = PanelController(
            xpos:
                instantFeedbackManager.getPanelPositionX(
                    right: SETTING_PANEL_INFO.bottomRightPoint!.x,
                    width: SETTING_PANEL_INFO.size.width,
                    padding: (MSG_WIDTH - SETTING_PANEL_INFO.size.width) / 2
                ),
            ypos:
                instantFeedbackManager.getPanelPositionY(
                    top: SETTING_PANEL_INFO.topLeftPoint!.y,
                    height: SETTING_PANEL_INFO.size.height,
                    padding: MSG_DISTANCE + MSG_HEIGHT
                ),
            width:
                instantFeedbackManager.getTotalFrameWidth(
                    width: SETTING_PANEL_INFO.size.width,
                    padding: (MSG_WIDTH - SETTING_PANEL_INFO.size.width) / 2
                ),
            height:
                instantFeedbackManager.getTotalFrameHeight(
                    height: SETTING_PANEL_INFO.size.height,
                    padding: MSG_DISTANCE + MSG_HEIGHT
                )
        )
        panelControllers[InstantPanel.setting] = settingPanelController
        
        settingPanelController.panel?.isMovableByWindowBackground = false
        settingPanelController.panel?.contentView = NSHostingView(
            rootView: SettingPanelView(panelController: settingPanelController)
        )
        settingPanelController.hidePanel(self)
    }
    
    func speedPanelControllerSetting() {
        let SPEED_PANEL_INFO = instantFeedbackManager.SPEED_PANEL_INFO
        let XMARK_RADIUS = instantFeedbackManager.PANEL_XMARK_RADIUS
        
        let originalXpos = instantFeedbackManager.getPanelPositionX(
            right: SPEED_PANEL_INFO.bottomRightPoint!.x,
            width: SPEED_PANEL_INFO.size.width,
            padding: XMARK_RADIUS
        )
        let originalYpos = instantFeedbackManager.getPanelPositionY(
            bottom: SPEED_PANEL_INFO.bottomRightPoint!.y,
            padding: XMARK_RADIUS
        )
        
        let xpos = loadPanelPosition(
            key: "SpeedPanelX",
            originalPos: originalXpos
        )
        let ypos = loadPanelPosition(
            key: "SpeedPanelY",
            originalPos: originalYpos
        )
        
        instantFeedbackManager.standardPanelPosition[2] = UserDefaults.standard.integer(forKey: "SpeedPanelX")
        instantFeedbackManager.standardPanelPosition[3] = UserDefaults.standard.integer(forKey: "SpeedPanelY")
        
        let speedPanelController = PanelController(
            xpos: xpos,
            ypos: ypos,
            width:
                instantFeedbackManager.getTotalFrameWidth(
                    width: SPEED_PANEL_INFO.size.width,
                    padding: XMARK_RADIUS
                ),
            height:
                instantFeedbackManager.getTotalFrameHeight(
                    height: SPEED_PANEL_INFO.size.height,
                    padding: XMARK_RADIUS
                )
        )
        panelControllers[InstantPanel.speed] = speedPanelController
        
        instantFeedbackManager.userDefaultsPanelPosition[2] = Int(speedPanelController.panel?.frame.origin.x ?? 0)
        instantFeedbackManager.userDefaultsPanelPosition[3] = Int(speedPanelController.panel?.frame.origin.y ?? 0)
        
        speedPanelController.panel?.contentView = NSHostingView(
            rootView: SpeedPanelView(panelController: speedPanelController)
        )
        speedPanelController.hidePanel(self)
    }
    
    func fillerWordPanelControllerSetting() {
        let FILLERWORD_PANEL_INFO = instantFeedbackManager.FILLERWORD_PANEL_INFO
        let XMARK_RADIUS = instantFeedbackManager.PANEL_XMARK_RADIUS
        
        let originalXpos = instantFeedbackManager.getPanelPositionX(
            right: FILLERWORD_PANEL_INFO.bottomRightPoint!.x,
            width: FILLERWORD_PANEL_INFO.size.width,
            padding: XMARK_RADIUS
        )
        let originalYpos = instantFeedbackManager.getPanelPositionY(
            bottom: FILLERWORD_PANEL_INFO.bottomRightPoint!.y,
            padding: XMARK_RADIUS
        )
        
        let xpos = loadPanelPosition(
            key: "FillerWordPanelX",
            originalPos: originalXpos
        )
        let ypos = loadPanelPosition(
            key: "FillerWordPanelY",
            originalPos: originalYpos
        )
        
        instantFeedbackManager.standardPanelPosition[4] = UserDefaults.standard.integer(forKey: "FillerWordPanelX")
        instantFeedbackManager.standardPanelPosition[5] = UserDefaults.standard.integer(forKey: "FillerWordPanelY")
        
        let fillerWordPanelController = PanelController(
            xpos: xpos,
            ypos: ypos,
            width:
                instantFeedbackManager.getTotalFrameWidth(
                    width: FILLERWORD_PANEL_INFO.size.width,
                    padding: XMARK_RADIUS
                ),
            height:
                instantFeedbackManager.getTotalFrameHeight(
                    height: FILLERWORD_PANEL_INFO.size.height,
                    padding: XMARK_RADIUS
                )
        )
        panelControllers[InstantPanel.fillerWord] = fillerWordPanelController
        
        instantFeedbackManager.userDefaultsPanelPosition[4] = Int(fillerWordPanelController.panel?.frame.origin.x ?? 0)
        instantFeedbackManager.userDefaultsPanelPosition[5] = Int(fillerWordPanelController.panel?.frame.origin.y ?? 0)
        
        fillerWordPanelController.panel?.contentView = NSHostingView(
            rootView: FillerWordPanelView(panelController: fillerWordPanelController)
        )
        fillerWordPanelController.hidePanel(self)
    }
    
    func editPanelControllerSetting() {
        let EDIT_PANEL_INFO = instantFeedbackManager.EDIT_PANEL_INFO
        
        let titleBarLength: CGFloat = 28.0
        
        let detailSettingPanelController = PanelController(
            xpos:
                instantFeedbackManager.getPanelPositionX(
                    right: EDIT_PANEL_INFO.bottomRightPoint!.x,
                    width: EDIT_PANEL_INFO.size.width,
                    padding: nil
                ),
            ypos:
                instantFeedbackManager.getPanelPositionY(
                    top: EDIT_PANEL_INFO.topLeftPoint!.y,
                    height: EDIT_PANEL_INFO.size.height,
                    padding: titleBarLength
                ),
            width: Int(EDIT_PANEL_INFO.size.width),
            height: Int(EDIT_PANEL_INFO.size.height)
        )
        panelControllers[InstantPanel.detailSetting] = detailSettingPanelController
        
        detailSettingPanelController.panel?.styleMask.insert(.titled)
        detailSettingPanelController.panel?.title = "실시간 피드백 레이아웃 편집"
        detailSettingPanelController.panel?.isMovableByWindowBackground = false
        detailSettingPanelController.panel?.isMovable = false
        detailSettingPanelController.panel?.contentView = NSHostingView(
            rootView: EditPanelView(panelController: detailSettingPanelController)
        )
        detailSettingPanelController.panel?.animationBehavior = .utilityWindow
        detailSettingPanelController.hidePanel(self)
    }
    
    func recordPanelControllerSetting() {
        let RECORD_PANEL_INFO = instantFeedbackManager.RECORD_PANEL_INFO
        
        let centerX = (NSScreen.screens[0].frame.width - RECORD_PANEL_INFO.size.width) / 2
        
        let recordPanelController = PanelController(
            xpos: Int(centerX),
            ypos:
                instantFeedbackManager.getPanelPositionY(
                    top: RECORD_PANEL_INFO.topLeftPoint!.y,
                    height: RECORD_PANEL_INFO.size.height,
                    padding: nil
                ),
            width: Int(RECORD_PANEL_INFO.size.width),
            height: Int(RECORD_PANEL_INFO.size.height)
        )
        panelControllers[InstantPanel.record] = recordPanelController
        recordPanelController.panel?.isMovableByWindowBackground = false
        
        recordPanelController.panel?.contentView = NSHostingView(
            rootView: RecordPanelView(panelController: recordPanelController)
        )
        recordPanelController.hidePanel(self)
    }
    
    func savePanelControllerSetting() {
        let SAVE_PANEL_INFO = instantFeedbackManager.SAVE_PANEL_INFO
        
        let centerX = (NSScreen.screens[0].frame.width - SAVE_PANEL_INFO.size.width) / 2
        let centerY = (NSScreen.screens[0].frame.height - SAVE_PANEL_INFO.size.height) / 2
        
        let savePanelController = PanelController(
            xpos: Int(centerX),
            ypos: Int(centerY),
            width: Int(SAVE_PANEL_INFO.size.width),
            height: Int(SAVE_PANEL_INFO.size.height)
        )
        panelControllers[InstantPanel.save] = savePanelController
        
        savePanelController.panel?.isMovableByWindowBackground = false
        savePanelController.panel?.contentView = NSHostingView(
            rootView: SavePanelView(panelController: savePanelController)
        )
        savePanelController.panel?.animationBehavior = .documentWindow
        savePanelController.hidePanel(self)
    }
    
    func loadPanelPosition(key: String, originalPos: Int) -> Int {
        #if DEBUG
        print("originalPos: \(originalPos)")
        print("UserDefaults: \(UserDefaults.standard.string(forKey: key).flatMap { Int($0) }!)")
        #endif
        let value = UserDefaults.standard.string(forKey: key) ?? nil
        
        if value == nil {
            return originalPos
        }
        return UserDefaults.standard.string(forKey: key).flatMap { Int($0) }!
    }
    
}
