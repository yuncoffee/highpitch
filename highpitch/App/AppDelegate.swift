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
        let timerPanelController = PanelController(
            xPosition: 36,
            yPosition: Int(NSScreen.screens[0].frame.height) - 124,
            swidth: 132, sheight: 80
        )
        panelControllers[InstantPanel.timer] = timerPanelController
        
        timerPanelController.panel?.contentView = NSHostingView(
            rootView: TimerPanelView(panelController: timerPanelController)
        )
        timerPanelController.hidePanel(self)
        
        // 세팅 패널
        let settingPanelController = PanelController(
            xPosition: Int(NSScreen.screens[0].frame.width) - 152,
            yPosition: Int(NSScreen.screens[0].frame.height) - 140,
            swidth: 116, sheight: 98
        )
        panelControllers[InstantPanel.setting] = settingPanelController
        
        settingPanelController.panel?.isMovableByWindowBackground = false
        settingPanelController.panel?.contentView = NSHostingView(
            rootView: SettingPanelView(panelController: settingPanelController)
        )
        settingPanelController.hidePanel(self)
        
        // 스피드 패널
        let speedPanelController = PanelController(
            xPosition: Int(NSScreen.screens[0].frame.width) - 207,
            yPosition: 249,
            swidth: 144, sheight: 144
        )
        panelControllers[InstantPanel.speed] = speedPanelController
        
        speedPanelController.panel?.contentView = NSHostingView(
            rootView: SpeedPanelView(panelController: speedPanelController)
        )
        speedPanelController.hidePanel(self)
        
        // 필러워드 패널
        let fillerWordPanelController = PanelController(
            xPosition: Int(NSScreen.screens[0].frame.width) - 207,
            yPosition: 113,
            swidth: 144, sheight: 144
        )
        panelControllers[InstantPanel.fillerWord] = fillerWordPanelController
        
        fillerWordPanelController.panel?.contentView = NSHostingView(
            rootView: FillerWordPanelView(panelController: fillerWordPanelController)
        )
        fillerWordPanelController.hidePanel(self)
        
        // 편집 패널
        let detailSettingPanelController = PanelController(
            xPosition: Int(NSScreen.screens[0].frame.width) - 304,
            yPosition: Int(NSScreen.screens[0].frame.height) - 362,
            swidth: 240, sheight: 229
        )
        panelControllers[InstantPanel.detailSetting] = detailSettingPanelController
        print(NSScreen.screens[0].frame.size)
        print(NSScreen.screens[0].frame.origin)
        print(NSScreen.screens[0].frame.minX)
        print(NSScreen.screens[0].frame.width)
        detailSettingPanelController.panel?.styleMask.insert(.titled)
        detailSettingPanelController.panel?.title = "실시간 피드백 레이아웃 편집"
        detailSettingPanelController.panel?.isMovableByWindowBackground = false
        detailSettingPanelController.panel?.contentView = NSHostingView(
            rootView: EditPanelView(panelController: detailSettingPanelController)
        )
        detailSettingPanelController.hidePanel(self)
        
        // 연습 기록 패널
        let recordPanelController = PanelController(
            xPosition: Int((NSScreen.screens[0].frame.width) / 2) - 179,
            yPosition: Int((NSScreen.screens[0].frame.height) - 67),
            swidth: 357, sheight: 29
        )
        panelControllers[InstantPanel.record] = recordPanelController
        // recordPanelController.panel?.isMovableByWindowBackground = false
        
        recordPanelController.panel?.contentView = NSHostingView(
            rootView: RecordPanelView(panelController: recordPanelController)
        )
        recordPanelController.showPanel(self)
        
        // 연습 저장 패널
        let savePanelController = PanelController(
            xPosition: Int((NSScreen.screens[0].frame.width) / 2) - 210,
            yPosition: Int((NSScreen.screens[0].frame.height) / 2) - 140,
            swidth: 420, sheight: 280
        )
        panelControllers[InstantPanel.save] = savePanelController
        
        savePanelController.panel?.isMovableByWindowBackground = false
        savePanelController.panel?.contentView = NSHostingView(
            rootView: SavePanelView(panelController: savePanelController)
        )
        savePanelController.hidePanel(self)
        
        // InstantFeedbackManager에 Controllers 저장
        SystemManager.shared.instantFeedbackManager.feedbackPanelControllers = panelControllers
    }
}
