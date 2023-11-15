//
//  FloatingPanelController.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

class FloatingPanelController: NSWindowController {
    var panel: NSPanel?
    
    init(xPosition: Int, yPosition: Int, swidth: Int, sheight: Int) {
        let panel = NSPanel(
            contentRect: NSRect(x: xPosition, y: yPosition, width: swidth, height: sheight),
            styleMask: [.nonactivatingPanel],
            backing: .buffered,
            defer: true
        )
        panel.backgroundColor = NSColor(.clear)
        panel.level = .mainMenu
        panel.collectionBehavior = [.fullScreenAuxiliary, .canJoinAllSpaces]
        panel.orderFrontRegardless()
        panel.isMovableByWindowBackground = true
        
        super.init(window: panel)
        self.panel = panel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func showPanel(_ sender: Any?) {
        self.panel?.makeKeyAndOrderFront(sender)
    }
    
    func hidePanel(_ sender: Any?) {
        self.panel?.orderOut(sender)
    }
    
}
