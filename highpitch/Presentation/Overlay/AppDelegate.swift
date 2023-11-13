//
//  AppDelegate.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

// MARK: 항상 맨 위에 떠 있는 뷰 (NSPanel)을 추가하기 위한 코드들
class AppDelegate: NSObject, NSApplicationDelegate {
    var floatingPanelControllers: [FloatingPanelController] = []
    
    var xPositions = [
        Int((NSScreen.main?.frame.width)! / 2) - 73,
        Int((NSScreen.main?.frame.width)!) - 120,
        Int((NSScreen.main?.frame.width)!) - 120,
        Int((NSScreen.main?.frame.width)!) - 120
    ]
    var yPositions = [
        Int((NSScreen.main?.frame.height)! - 100),
        Int((NSScreen.main?.frame.height)! - 100), 120, 0]
    var widths = [146, 44, 120, 120]
    var heights = [56, 28, 120, 120]
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // 타이머 패널
        let floatingTimerPanelController = FloatingPanelController(
            xPosition: Int((NSScreen.main?.frame.width)! / 2) - 73,
            yPosition: Int((NSScreen.main?.frame.height)! - 100),
            swidth: 146, sheight: 56
        )
        floatingPanelControllers.append(floatingTimerPanelController)
        
        floatingTimerPanelController.panel?.contentView = NSHostingView(rootView: TimerPanelView(floatingPanelController: floatingTimerPanelController))
        floatingTimerPanelController.hidePanel(self)
        
        // 세팅 패널
        let floatingSettingPanelController = FloatingPanelController(xPosition: Int((NSScreen.main?.frame.width)!) - 120, yPosition: Int((NSScreen.main?.frame.height)! - 100), swidth: 44, sheight: 28)
        floatingPanelControllers.append(floatingSettingPanelController)
        
        floatingSettingPanelController.panel?.contentView = NSHostingView(rootView: SettingPanelView(floatingPanelController: floatingSettingPanelController))
        floatingSettingPanelController.hidePanel(self)
        
        // 스피드 패널
        let floatingSpeedPanelController = FloatingPanelController(xPosition: Int((NSScreen.main?.frame.width)!) - 120, yPosition: 120, swidth: 120, sheight: 120)
        floatingPanelControllers.append(floatingSpeedPanelController)
        
        floatingSpeedPanelController.panel?.contentView = NSHostingView(rootView: SpeedPanelView(floatingPanelController: floatingSpeedPanelController))
        floatingSpeedPanelController.hidePanel(self)
        
        // 필러워드 패널
        let floatingFillerwordPanelController = FloatingPanelController(xPosition: Int((NSScreen.main?.frame.width)!) - 120, yPosition: 0, swidth: 120, sheight: 120)
        floatingPanelControllers.append(floatingFillerwordPanelController)
        
        floatingFillerwordPanelController.panel?.contentView = NSHostingView(rootView: FillerwordPanelView(floatingPanelController: floatingFillerwordPanelController))
        floatingFillerwordPanelController.hidePanel(self)
        
        // 편집 패널
        let floatingEditPanelController = FloatingPanelController(xPosition: 500, yPosition: 500, swidth: 436, sheight: 292)
        floatingPanelControllers.append(floatingEditPanelController)
        
        floatingEditPanelController.panel?.styleMask.insert(.titled)
        
        floatingEditPanelController.panel?.title = "실시간 피드백 레이아웃 편집"
        floatingEditPanelController.panel?.contentView = NSHostingView(rootView: EditPanelView(floatingPanelController: floatingEditPanelController))
        floatingEditPanelController.hidePanel(self)
    }
}
