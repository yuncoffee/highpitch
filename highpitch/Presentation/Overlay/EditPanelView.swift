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
    
    let EDIT_PANEL_INFO = SystemManager.shared.instantFeedbackManager.EDIT_PANEL_INFO
    
    var body: some View {
        VStack {
            Spacer()

            VStack(alignment:.center, spacing: 16) {
                HStack {
                    Text("타이머")
                        .systemFont(.caption, weight: .semibold)
                        .foregroundStyle(Color.HPTextStyle.base)
                    Spacer()
                    Toggle(isOn: $timerPanelOn) {}
                        .toggleStyle(HPToggleStyle())
                }
                .frame(width: 155.27)
                
                HStack {
                    Text("습관어")
                        .systemFont(.caption, weight: .semibold)
                        .foregroundStyle(Color.HPTextStyle.base)
                    Spacer()
                    Toggle(isOn: $fillerWordPanelOn) {}
                        .toggleStyle(HPToggleStyle())
                }
                .frame(width: 155.27)
                
                HStack {
                    Text("말 빠르기")
                        .systemFont(.caption, weight: .semibold)
                        .foregroundStyle(Color.HPTextStyle.base)
                    Spacer()
                    Toggle(isOn: $speedPanelOn) {}
                        .toggleStyle(HPToggleStyle())
                }
                .frame(width: 155.27)
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
            
            HStack {
                HPButton(color: Color("3A3241")) {
                    // activePanel에 모두 다 넣고
                    instantFeedbackManager.activePanels.insert(InstantPanel.timer)
                    instantFeedbackManager.activePanels.insert(InstantPanel.speed)
                    instantFeedbackManager.activePanels.insert(InstantPanel.fillerWord)
                    
                    // Panel들의 기본 위치 계산
                    let timerPanelX = instantFeedbackManager.getPanelPositionX(
                        left: instantFeedbackManager.TIMER_PANEL_INFO.topLeftPoint!.x,
                        padding: instantFeedbackManager.PANEL_XMARK_RADIUS
                    )
                    let timerPanelY = instantFeedbackManager.getPanelPositionY(
                        top: instantFeedbackManager.TIMER_PANEL_INFO.topLeftPoint!.y,
                        height: instantFeedbackManager.TIMER_PANEL_INFO.size.height,
                        padding: instantFeedbackManager.PANEL_XMARK_RADIUS
                    )
                    let speedPanelX = instantFeedbackManager.getPanelPositionX(
                        right: instantFeedbackManager.SPEED_PANEL_INFO.bottomRightPoint!.x,
                        width: instantFeedbackManager.SPEED_PANEL_INFO.size.width,
                        padding: instantFeedbackManager.PANEL_XMARK_RADIUS
                    )
                    let speedPanelY = instantFeedbackManager.getPanelPositionY(
                        bottom: instantFeedbackManager.SPEED_PANEL_INFO.bottomRightPoint!.y,
                        padding: instantFeedbackManager.PANEL_XMARK_RADIUS
                    )
                    let fillerWordPanelX = instantFeedbackManager.getPanelPositionX(
                        right: instantFeedbackManager.FILLERWORD_PANEL_INFO.bottomRightPoint!.x,
                        width: instantFeedbackManager.FILLERWORD_PANEL_INFO.size.width,
                        padding: instantFeedbackManager.PANEL_XMARK_RADIUS
                    )
                    let fillerWordPanelY = instantFeedbackManager.getPanelPositionY(
                        bottom: instantFeedbackManager.FILLERWORD_PANEL_INFO.bottomRightPoint!.y,
                        padding: instantFeedbackManager.PANEL_XMARK_RADIUS
                    )
                    
                    print("원래 TimerX: \(UserDefaults.standard.integer(forKey: "TimerPanelX")) TimerY: ", UserDefaults.standard.integer(forKey: "TimerPanelY"))
                    
                    // 위치 기본값으로 조절
                    instantFeedbackManager.feedbackPanelControllers[InstantPanel.timer]?.panel?
                        .setFrameOrigin(NSPoint(x: timerPanelX, y: timerPanelY))
                    instantFeedbackManager.feedbackPanelControllers[InstantPanel.speed]?.panel?
                        .setFrameOrigin(NSPoint(x: speedPanelX, y: speedPanelY))
                    instantFeedbackManager.feedbackPanelControllers[InstantPanel.fillerWord]?.panel?
                        .setFrameOrigin(NSPoint(x: fillerWordPanelX, y: fillerWordPanelY))
                    
                    // UserDefaults도 원상복귀
                    #if DEBUG
                    print("TimerX 원상복귀: \(timerPanelX)")
                    print("TimerY 원상복귀: \(timerPanelY)")
                    #endif
                    UserDefaults.standard.set(timerPanelX + 11, forKey: "TimerPanelX")
                    UserDefaults.standard.set(timerPanelY + 11, forKey: "TimerPanelY")
                    UserDefaults.standard.set(speedPanelX + 11, forKey: "SpeedPanelX")
                    UserDefaults.standard.set(speedPanelY + 11, forKey: "SpeedPanelY")
                    UserDefaults.standard.set(fillerWordPanelX + 11, forKey: "FillerWordPanelX")
                    UserDefaults.standard.set(fillerWordPanelY + 11, forKey: "FillerWordPanelY")
                    print("원위치로 TimerX: \(UserDefaults.standard.integer(forKey: "TimerPanelX")) TimerY: ", UserDefaults.standard.integer(forKey: "TimerPanelY"))
                    
                    instantFeedbackManager.resetButtonDisabled = true
                    
                } label: { type, _, color, expandable in
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
                .disabled(instantFeedbackManager.resetButtonDisabled)
            }
            
            Spacer()
        }
        .frame(width: EDIT_PANEL_INFO.size.width, height: EDIT_PANEL_INFO.size.height)
        .background(Color.white)
        .onTapGesture {
            instantFeedbackManager.focusedPanel = .detailSetting
        }
    }
}

struct HPToggleStyle: ToggleStyle {
    private let width = 32.0
    private let height = 17.6
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 11)
                    .frame(width: width, height: height)
                    .foregroundColor(configuration.isOn ? Color.HPPrimary.base : Color.HPGray.system400)
                    .onTapGesture {
                        withAnimation {
                            configuration.$isOn.wrappedValue.toggle()
                        }
                    }
                
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 16, height: 15.25)
                    .padding(1)
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation {
                            configuration.$isOn.wrappedValue.toggle()
                        }
                    }
            }
        }
        .padding(.vertical, 5)
    }
}
