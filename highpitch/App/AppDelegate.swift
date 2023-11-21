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
        
        let timerPanelController = PanelController(
            xPosition:
                instantFeedbackManager.getPanelPositionX(
                    left: TIMER_PANEL_INFO.topLeftPoint!.x,
                    padding: XMARK_RADIUS
                ),
            yPosition:
                instantFeedbackManager.getPanelPositionY(
                    head: TIMER_PANEL_INFO.topLeftPoint!.y,
                    height: TIMER_PANEL_INFO.size.height,
                    padding: XMARK_RADIUS
                ),
            swidth:
                instantFeedbackManager.getTotalFrameWidth(
                    width: TIMER_PANEL_INFO.size.width,
                    padding: XMARK_RADIUS
                ),
            sheight:
                instantFeedbackManager.getTotalFrameHeight(
                    height: TIMER_PANEL_INFO.size.height,
                    padding: XMARK_RADIUS
                )
        )
        panelControllers[InstantPanel.timer] = timerPanelController
        
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
            xPosition:
                instantFeedbackManager.getPanelPositionX(
                    right: SETTING_PANEL_INFO.bottomRightPoint!.x,
                    width: SETTING_PANEL_INFO.size.width,
                    padding: (MSG_WIDTH - SETTING_PANEL_INFO.size.width) / 2
                ),
            yPosition:
                instantFeedbackManager.getPanelPositionY(
                    head: SETTING_PANEL_INFO.topLeftPoint!.y,
                    height: SETTING_PANEL_INFO.size.height,
                    padding: MSG_DISTANCE + MSG_HEIGHT
                ),
            swidth:
                instantFeedbackManager.getTotalFrameWidth(
                    width: SETTING_PANEL_INFO.size.width,
                    padding: (MSG_WIDTH - SETTING_PANEL_INFO.size.width) / 2
                ),
            sheight:
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
        
        let speedPanelController = PanelController(
            xPosition:
                instantFeedbackManager.getPanelPositionX(
                    right: SPEED_PANEL_INFO.bottomRightPoint!.x,
                    width: SPEED_PANEL_INFO.size.width,
                    padding: XMARK_RADIUS
                ),
            yPosition:
                instantFeedbackManager.getPanelPositionY(
                    bottom: SPEED_PANEL_INFO.bottomRightPoint!.y,
                    padding: XMARK_RADIUS
                ),
            swidth:
                instantFeedbackManager.getTotalFrameWidth(
                    width: SPEED_PANEL_INFO.size.width,
                    padding: XMARK_RADIUS
                ),
            sheight:
                instantFeedbackManager.getTotalFrameHeight(
                    height: SPEED_PANEL_INFO.size.height,
                    padding: XMARK_RADIUS
                )
        )
        panelControllers[InstantPanel.speed] = speedPanelController
        
        speedPanelController.panel?.contentView = NSHostingView(
            rootView: SpeedPanelView(panelController: speedPanelController)
        )
        speedPanelController.hidePanel(self)
    }
    
    func fillerWordPanelControllerSetting() {
        let FILLERWORD_PANEL_INFO = instantFeedbackManager.FILLERWORD_PANEL_INFO
        let XMARK_RADIUS = instantFeedbackManager.PANEL_XMARK_RADIUS
        
        let fillerWordPanelController = PanelController(
            xPosition:
                instantFeedbackManager.getPanelPositionX(
                    right: FILLERWORD_PANEL_INFO.bottomRightPoint!.x,
                    width: FILLERWORD_PANEL_INFO.size.width,
                    padding: XMARK_RADIUS
                ),
            yPosition:
                instantFeedbackManager.getPanelPositionY(
                    bottom: FILLERWORD_PANEL_INFO.bottomRightPoint!.y,
                    padding: XMARK_RADIUS
                ),
            swidth:
                instantFeedbackManager.getTotalFrameWidth(
                    width: FILLERWORD_PANEL_INFO.size.width,
                    padding: XMARK_RADIUS
                ),
            sheight:
                instantFeedbackManager.getTotalFrameHeight(
                    height: FILLERWORD_PANEL_INFO.size.height,
                    padding: XMARK_RADIUS
                )
        )
        panelControllers[InstantPanel.fillerWord] = fillerWordPanelController
        
        fillerWordPanelController.panel?.contentView = NSHostingView(
            rootView: FillerWordPanelView(panelController: fillerWordPanelController)
        )
        fillerWordPanelController.hidePanel(self)
    }
    
    func editPanelControllerSetting() {
        let EDIT_PANEL_INFO = instantFeedbackManager.EDIT_PANEL_INFO
        
        let titleBarLength: CGFloat = 28.0
        
        let detailSettingPanelController = PanelController(
            xPosition: 
                instantFeedbackManager.getPanelPositionX(
                    right: EDIT_PANEL_INFO.bottomRightPoint!.x,
                    width: EDIT_PANEL_INFO.size.width,
                    padding: nil
                ),
            yPosition:
                instantFeedbackManager.getPanelPositionY(
                    head: EDIT_PANEL_INFO.topLeftPoint!.y,
                    height: EDIT_PANEL_INFO.size.height,
                    padding: titleBarLength
                ),
            swidth: Int(EDIT_PANEL_INFO.size.width),
            sheight: Int(EDIT_PANEL_INFO.size.height)
        )
        panelControllers[InstantPanel.detailSetting] = detailSettingPanelController
        
        detailSettingPanelController.panel?.styleMask.insert(.titled)
        detailSettingPanelController.panel?.title = "실시간 피드백 레이아웃 편집"
        detailSettingPanelController.panel?.isMovableByWindowBackground = false
        detailSettingPanelController.panel?.contentView = NSHostingView(
            rootView: EditPanelView(panelController: detailSettingPanelController)
        )
        detailSettingPanelController.hidePanel(self)
    }
    
    func recordPanelControllerSetting() {
        let RECORD_PANEL_INFO = instantFeedbackManager.RECORD_PANEL_INFO
        
        let centerX = (NSScreen.screens[0].frame.width - RECORD_PANEL_INFO.size.width) / 2
        
        let recordPanelController = PanelController(
            xPosition: Int(centerX),
            yPosition:
                instantFeedbackManager.getPanelPositionY(
                    head: RECORD_PANEL_INFO.topLeftPoint!.y,
                    height: RECORD_PANEL_INFO.size.height,
                    padding: nil
                ),
            swidth: Int(RECORD_PANEL_INFO.size.width),
            sheight: Int(RECORD_PANEL_INFO.size.height)
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
            xPosition: Int(centerX),
            yPosition: Int(centerY),
            swidth: Int(SAVE_PANEL_INFO.size.width),
            sheight: Int(SAVE_PANEL_INFO.size.height)
        )
        panelControllers[InstantPanel.save] = savePanelController
        
        savePanelController.panel?.isMovableByWindowBackground = false
        savePanelController.panel?.contentView = NSHostingView(
            rootView: SavePanelView(panelController: savePanelController)
        )
        savePanelController.hidePanel(self)
    }
    
}
