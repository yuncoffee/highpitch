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
        print("NSScreen.main?.frame: \(NSScreen.main?.frame)")
        print("NSScreen.main?.visibleFrame: \(NSScreen.main?.visibleFrame)")
        
        // 타이머 패널
        let timerPanelController = PanelController(
            xPosition: instantFeedbackManager.timerPanelX,
            yPosition: instantFeedbackManager.timerPanelY,
            swidth: 146, sheight: 56
        )
        panelControllers[InstantPanel.timer] = timerPanelController
        
        timerPanelController.panel?.contentView = NSHostingView(
            rootView: TimerPanelView(panelController: timerPanelController)
        )
        timerPanelController.hidePanel(self)
        
        // 세팅 패널
        let settingPanelController = PanelController(
            xPosition: Int((NSScreen.main?.visibleFrame.width)!) - 120,
            yPosition: Int((NSScreen.main?.visibleFrame.height)! - 15),
            swidth: 44, sheight: 28
        )
        panelControllers[InstantPanel.setting] = settingPanelController
        
        settingPanelController.panel?.isMovableByWindowBackground = false
        settingPanelController.panel?.contentView = NSHostingView(
            rootView: SettingPanelView(panelController: settingPanelController)
        )
        settingPanelController.hidePanel(self)
        
        // 스피드 패널
        let speedPanelController = PanelController(
            xPosition: instantFeedbackManager.speedPanelX,
            yPosition: instantFeedbackManager.speedPanelY,
            swidth: 150, sheight: 150
        )
        panelControllers[InstantPanel.speed] = speedPanelController
        
        speedPanelController.panel?.contentView = NSHostingView(
            rootView: SpeedPanelView(panelController: speedPanelController)
        )
        speedPanelController.hidePanel(self)
        
        // 필러워드 패널
        let fillerWordPanelController = PanelController(
            xPosition: instantFeedbackManager.fillerWordPanelX,
            yPosition: instantFeedbackManager.fillerWordPanelY,
            swidth: 150, sheight: 150
        )
        panelControllers[InstantPanel.fillerWord] = fillerWordPanelController
        
        fillerWordPanelController.panel?.contentView = NSHostingView(
            rootView: FillerWordPanelView(panelController: fillerWordPanelController)
        )
        fillerWordPanelController.hidePanel(self)
        
        // 편집 패널
        let detailSettingPanelController = PanelController(
            xPosition: instantFeedbackManager.detailPanelX,
            yPosition: instantFeedbackManager.detailPanelY,
            swidth: 436, sheight: 292
        )
        panelControllers[InstantPanel.detailSetting] = detailSettingPanelController
        
        detailSettingPanelController.panel?.styleMask.insert(.titled)
        detailSettingPanelController.panel?.title = "실시간 피드백 레이아웃 편집"
        detailSettingPanelController.panel?.contentView = NSHostingView(
            rootView: EditPanelView(panelController: detailSettingPanelController)
        )
        detailSettingPanelController.hidePanel(self)
        
        // 연습 기록 패널
        let recordPanelController = PanelController(
            xPosition: Int((NSScreen.screens[0].frame.width) / 2) - 179,
            yPosition: Int((NSScreen.screens[0].frame.height) - 129),
            swidth: 357, sheight: 29
        )
        panelControllers[InstantPanel.record] = recordPanelController
        
        recordPanelController.panel?.contentView = NSHostingView(
            rootView: RecordPanelView(panelController: recordPanelController)
        )
        recordPanelController.showPanel(self)
        
        // 연습 저장 패널
        let savePanelController = PanelController(
            xPosition: Int((NSScreen.screens[0].visibleFrame.width) / 2) - 579,
            yPosition: Int(NSScreen.screens[0].visibleFrame.height) - 288,
            swidth: 420, sheight: 280
        )
        panelControllers[InstantPanel.save] = savePanelController
        
        savePanelController.panel?.contentView = NSHostingView(
            rootView: SavePanelView(panelController: savePanelController)
        )
        // savePanelController.panel?.screen = NSScreen.screens[0]
        savePanelController.panel?.center()
        savePanelController.hidePanel(self)
        
        // InstantFeedbackManager에 Controllers 저장
        SystemManager.shared.instantFeedbackManager.feedbackPanelControllers = panelControllers
    }
}
