//
//  AppDelegate.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

// MARK: 항상 맨 위에 떠 있는 뷰 (NSPanel)을 추가하기 위한 코드들
class AppDelegate: NSObject, NSApplicationDelegate {
    var floatingPanelControllers: [InstantPanel:FloatingPanelController] = [:]
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("NSScreen.main?.frame: \(NSScreen.main?.frame)")
        print("NSScreen.main?.visibleFrame: \(NSScreen.main?.visibleFrame)")
        
        // 타이머 패널
        let floatingTimerPanelController = FloatingPanelController(
            xPosition: Int((NSScreen.main?.visibleFrame.width)! / 2) - 73,
            yPosition: Int((NSScreen.main?.visibleFrame.height)!) - 15,
            swidth: 146, sheight: 56
        )
        floatingPanelControllers[InstantPanel.timer] = floatingTimerPanelController
        
        floatingTimerPanelController.panel?.contentView = NSHostingView(
            rootView: TimerPanelView(floatingPanelController: floatingTimerPanelController)
        )
        floatingTimerPanelController.hidePanel(self)
        
        // 세팅 패널
        let floatingSettingPanelController = FloatingPanelController(
            xPosition: Int((NSScreen.main?.visibleFrame.width)!) - 120,
            yPosition: Int((NSScreen.main?.visibleFrame.height)! - 15),
            swidth: 44, sheight: 28
        )
        floatingPanelControllers[InstantPanel.setting] = floatingSettingPanelController
        
        floatingSettingPanelController.panel?.isMovableByWindowBackground = false
        floatingSettingPanelController.panel?.contentView = NSHostingView(
            rootView: SettingPanelView(floatingPanelController: floatingSettingPanelController)
        )
        floatingSettingPanelController.hidePanel(self)
        
        // 스피드 패널
        let floatingSpeedPanelController = FloatingPanelController(
            xPosition: Int((NSScreen.main?.visibleFrame.width)!) - 178,
            yPosition: 276, swidth: 150, sheight: 150
        )
        floatingPanelControllers[InstantPanel.speed] = floatingSpeedPanelController
        
        floatingSpeedPanelController.panel?.contentView = NSHostingView(
            rootView: SpeedPanelView(floatingPanelController: floatingSpeedPanelController)
        )
        floatingSpeedPanelController.hidePanel(self)
        
        // 필러워드 패널
        let floatingFillerwordPanelController = FloatingPanelController(
            xPosition: Int((NSScreen.main?.visibleFrame.width)!) - 178,
            yPosition: 129, swidth: 150, sheight: 150
        )
        floatingPanelControllers[InstantPanel.fillerWord] = floatingFillerwordPanelController
        
        floatingFillerwordPanelController.panel?.contentView = NSHostingView(
            rootView: FillerWordPanelView(floatingPanelController: floatingFillerwordPanelController)
        )
        floatingFillerwordPanelController.hidePanel(self)
        
        // 편집 패널
        let floatingEditPanelController = FloatingPanelController(
            xPosition: 56, yPosition: 116, swidth: 436, sheight: 292
        )
        floatingPanelControllers[InstantPanel.detailSetting] = floatingEditPanelController
        
        floatingEditPanelController.panel?.styleMask.insert(.titled)
        
        floatingEditPanelController.panel?.title = "실시간 피드백 레이아웃 편집"
        floatingEditPanelController.panel?.contentView = NSHostingView(
            rootView: EditPanelView(floatingPanelController: floatingEditPanelController)
        )
        floatingEditPanelController.hidePanel(self)
    }
}
