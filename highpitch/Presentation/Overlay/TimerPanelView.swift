//
//  TimerPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct TimerPanelView: View {
    @State private var timer: Timer? = nil
    @State private var elapsedTime: TimeInterval = 0.0
    
    var panelController: PanelController
    var instantFeedbackManager = SystemManager.shared.instantFeedbackManager
    
    let TIMER_PANEL_INFO = SystemManager.shared.instantFeedbackManager.TIMER_PANEL_INFO
    let XMARK_RADIUS = SystemManager.shared.instantFeedbackManager.PANEL_XMARK_RADIUS
    let XMARK_WIDTH = SystemManager.shared.instantFeedbackManager.PANEL_XMARK_CIRCLE_WIDTH
    
    var formattedElapsedTime: String {
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var body: some View {
        VStack {
            VStack(spacing: .zero) {
                ZStack {
                    Text(formattedElapsedTime)
                        .systemFont(.title, weight: .semibold)
                        .foregroundStyle(Color.HPTextStyle.darkness)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("FFFFFF").opacity(0.5))
            .edgesIgnoringSafeArea(.all)
            .clipShape(RoundedRectangle(cornerRadius: .HPCornerRadius.large))
            .onChange(of: SystemManager.shared.instantFeedbackManager.isTimerRunning) { _, value in
                if value == 1 {
                    // 타이머 실행
                    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                        elapsedTime += 1.0
                    }
                } else if value == 0 {
                    // 타이머 정지
                    timer?.invalidate()
                } else {
                    // 타이머 정지 및 초기화
                    timer?.invalidate()
                    elapsedTime = 0.0
                }
            }
        }
        .frame(
            width: TIMER_PANEL_INFO.size.width,
            height: TIMER_PANEL_INFO.size.height
        )
        .padding(18)
        .overlay {
            ZStack(alignment: .topTrailing) {
                if instantFeedbackManager.focusedPanel == .timer {
                    Button {
                        if instantFeedbackManager.activePanels.contains(InstantPanel.timer) {
                            instantFeedbackManager.activePanels.remove(InstantPanel.timer)
                        }
                    } label: {
                        Circle()
                            .fill(Color.HPPrimary.lightness)
                            .stroke(
                                Color.HPPrimary.base,
                                lineWidth: XMARK_WIDTH
                            )
                            .frame(
                                width: XMARK_RADIUS * 2,
                                height: XMARK_RADIUS * 2
                            )
                            .overlay {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(
                                        width: XMARK_RADIUS,
                                        height: XMARK_RADIUS
                                    )
                                    .fontWeight(.black)
                                    .foregroundStyle(Color.HPPrimary.base)
                            }
                    }
                    .buttonStyle(.plain)
                    .offset(
                        x: TIMER_PANEL_INFO.size.width / 2 - XMARK_WIDTH,
                        y: XMARK_WIDTH - (TIMER_PANEL_INFO.size.height / 2)
                    )
                }
            }
        }
        .onHover { value in
            if value {
                instantFeedbackManager.focusedPanel = .timer
            } else {
                // Hover Out 되었을때, 해당 위치를 UserDefaults에 넣는다.
                UserDefaults.standard.set(
                    String(Int(panelController.getPanelPosition()!.x)),
                    forKey: "TimerPanelX"
                )
                UserDefaults.standard.set(
                    String(Int(panelController.getPanelPosition()!.y)),
                    forKey: "TimerPanelY"
                )
                #if DEBUG
                print("UserDefaults에 넣겠습니다.")
                print("xpos: \(panelController.getPanelPosition()!.x)")
                print("ypos: \(panelController.getPanelPosition()!.y)")
                #endif
                instantFeedbackManager.focusedPanel = nil
                
                let originalXpos = instantFeedbackManager.getPanelPositionX(
                    left: TIMER_PANEL_INFO.topLeftPoint!.x,
                    padding: XMARK_RADIUS
                )
                let originalYpos = instantFeedbackManager.getPanelPositionY(
                    top: TIMER_PANEL_INFO.topLeftPoint!.y,
                    height: TIMER_PANEL_INFO.size.height,
                    padding: XMARK_RADIUS
                )
                
                instantFeedbackManager.movablePanelMoved[0] = (Int(panelController.getPanelPosition()!.x) == originalXpos + 11) ? false : true
                instantFeedbackManager.movablePanelMoved[1] = (Int(panelController.getPanelPosition()!.y) == originalYpos + 11) ? false : true
                instantFeedbackManager.resetButtonDisabled = instantFeedbackManager.movablePanelMoved[0] ? false : true
            }
        }
        .onChange(of: instantFeedbackManager.movablePanelMoved[0]) {
            if instantFeedbackManager.movablePanelMoved[0] {
                instantFeedbackManager.resetButtonDisabled = false
            } else {
                instantFeedbackManager.movablePanelMoved[0] = true
            }
        }
        .frame(
            width: instantFeedbackManager.getTotalFrameWidth(
                width: TIMER_PANEL_INFO.size.width,
                padding: XMARK_RADIUS
            ),
            height: instantFeedbackManager.getTotalFrameHeight(
                height: TIMER_PANEL_INFO.size.height,
                padding: XMARK_RADIUS
            )
        )
    }
}
