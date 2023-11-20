//
//  EditPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct EditPanelView: View {
    @State private var fillerWordPanelOn = true
    @State private var speedPanelOn = true
    @State private var timerPanelOn = true
    
    var panelController: PanelController
    var instantFeedbackManager = SystemManager.shared.instantFeedbackManager
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(alignment: .top) {
                Spacer()
                VStack(alignment: .leading, spacing: 16) {
                    Text("타이머")
                        .systemFont(.caption, weight: .semibold)
                        .foregroundStyle(Color.HPTextStyle.base)
                    Text("습관어")
                        .systemFont(.caption, weight: .semibold)
                        .foregroundStyle(Color.HPTextStyle.base)
                    Text("말 빠르기")
                        .systemFont(.caption, weight: .semibold)
                        .foregroundStyle(Color.HPTextStyle.base)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 16) {
                    Toggle(isOn: $timerPanelOn) {}
                        .toggleStyle(SwitchToggleStyle(tint: Color("0xBB77AA")))
                    Toggle(isOn: $fillerWordPanelOn) {}
                        .toggleStyle(SwitchToggleStyle(tint: Color("0xBB77AA")))
                    Toggle(isOn: $speedPanelOn) {}
                        .toggleStyle(SwitchToggleStyle(tint: Color("0xBB77AA")))
                }
                .onChange(of: instantFeedbackManager.activePanels) {
                    if instantFeedbackManager.activePanels.contains(.timer) {
                        timerPanelOn = true
                    }
                    if !instantFeedbackManager.activePanels.contains(.timer) {
                        timerPanelOn = false
                    }
                    if instantFeedbackManager.activePanels.contains(.fillerWord) {
                        fillerWordPanelOn = true
                    }
                    if !instantFeedbackManager.activePanels.contains(.fillerWord) {
                        fillerWordPanelOn = false
                    }
                    if instantFeedbackManager.activePanels.contains(.speed) {
                        speedPanelOn = true
                    }
                    if !instantFeedbackManager.activePanels.contains(.speed) {
                        speedPanelOn = false
                    }
                }
                .onChange(of: timerPanelOn) { _, value in
                    if value && !instantFeedbackManager.activePanels.contains(.timer) {
                        instantFeedbackManager.activePanels.insert(.timer)
                    }
                    if !value && instantFeedbackManager.activePanels.contains(.timer) {
                        instantFeedbackManager.activePanels.remove(.timer)
                    }
                }
                .onChange(of: fillerWordPanelOn) {  _, value in
                    if value && !instantFeedbackManager.activePanels.contains(.fillerWord) {
                        instantFeedbackManager.activePanels.insert(.fillerWord)
                    }
                    if !value && instantFeedbackManager.activePanels.contains(.fillerWord) {
                        instantFeedbackManager.activePanels.remove(.fillerWord)
                    }
                }
                .onChange(of: speedPanelOn) {  _, value in
                    if value && !instantFeedbackManager.activePanels.contains(.speed) {
                        instantFeedbackManager.activePanels.insert(.speed)
                    }
                    if !value && instantFeedbackManager.activePanels.contains(.timer) {
                        instantFeedbackManager.activePanels.remove(.speed)
                    }
                }
                Spacer()
            }
        
            Spacer()
            
            HStack {
                HPButton(color: Color("3A3241")) {
                    // activePanel에 모두 다 넣고
                    instantFeedbackManager.activePanels.insert(InstantPanel.timer)
                    instantFeedbackManager.activePanels.insert(InstantPanel.speed)
                    instantFeedbackManager.activePanels.insert(InstantPanel.fillerWord)
                    
//                    instantFeedbackManager.feedbackPanelControllers[InstantPanel.timer]?.panel?
//                        .setFrameTopLeftPoint(NSPoint(x:48, y:Int((NSScreen.main?.visibleFrame.height)!)))
//
                    instantFeedbackManager.feedbackPanelControllers[InstantPanel.timer]?.panel?
                        .setFrameOrigin(NSPoint(x: 48, y: Int((NSScreen.main?.visibleFrame.height)!) - 56))
                        
                    // 위치 기본값으로 조절
//                    instantFeedbackManager.feedbackPanelControllers[InstantPanel.timer]?.panel?
//                        .setFrameOrigin(NSPoint(x:48, y:Int((NSScreen.main?.visibleFrame.height)!) - 56))
                    instantFeedbackManager.feedbackPanelControllers[InstantPanel.speed]?.panel?
                        .setFrameOrigin(NSPoint(x:Int((NSScreen.main?.visibleFrame.width)!) - 178, y:276))
                    instantFeedbackManager.feedbackPanelControllers[InstantPanel.fillerWord]?.panel?
                        .setFrameOrigin(NSPoint(x:Int((NSScreen.main?.visibleFrame.width)!) - 178, y:129))
                    instantFeedbackManager.feedbackPanelControllers[InstantPanel.detailSetting]?.panel?
                        .setFrameOrigin(NSPoint(x:56, y:116))
                    
                    // UserDefaults도 원상복귀
                    UserDefaults.standard.set( String(48), forKey: "TimerPanelX")
                    UserDefaults.standard.set(String(Int((NSScreen.main?.visibleFrame.height)!) - 56), forKey: "TimerPanelY")
                    UserDefaults.standard.set( String(Int((NSScreen.main?.visibleFrame.width)!) - 178), forKey: "SpeedPanelX")
                    UserDefaults.standard.set(String(276), forKey: "SpeedPanelY")
                    UserDefaults.standard.set( String(Int((NSScreen.main?.visibleFrame.width)!) - 178), forKey: "FillerWordPanelX")
                    UserDefaults.standard.set(String(129), forKey: "FillerWordPanelY")
                    UserDefaults.standard.set(String(56), forKey: "DetailPanelX")
                    UserDefaults.standard.set(String(116), forKey: "DetailPanelY")
                    
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: (label: "기본 레이아웃 사용", icon: nil),
                        type: type,
                        size: .small,
                        color: color,
                        expandable: expandable,
                        fontStyle: .systemDetail(.caption, .semibold),
                        padding: (v:4, h:16)
                    )
                }
                .frame(width: 144)
            }
            
            Spacer()
        }
        .frame(width: 240, height: 247)
        .background(Color.white)
        .onTapGesture {
            instantFeedbackManager.focusedPanel = .detailSetting
        }
        .onHover { value in
            if !value {
                // Hover Out 되었을때, 해당 위치를 UserDefaults에 넣는다.
                UserDefaults.standard.set( String(Int(panelController.getPanelPosition()!.x)), forKey: "DetailPanelX")
                UserDefaults.standard.set(String(Int(panelController.getPanelPosition()!.y)), forKey: "DetailPanelY")
            }
        }
    }
}
