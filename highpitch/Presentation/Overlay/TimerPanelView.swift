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
    @State private var isTimerRunning = false
    
    var panelController: PanelController
    var instantFeedbackManager = SystemManager.shared.instantFeedbackManager
    
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
            .onTapGesture {
                if isTimerRunning {
                    // 타이머가 실행 중인 경우
                    timer?.invalidate()
                    isTimerRunning = false
                    print("Timer Stopped. Elapsed Time: \(formattedElapsedTime)")
                } else {
                    // 타이머가 실행 중이지 않은 경우
                    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                        elapsedTime += 1.0
                    }
                    isTimerRunning = true
                    print("Timer Started.")
                }
            }
        }
        .frame(width: 108, height: 56)
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
                            .stroke(Color.HPPrimary.base, lineWidth: 2)
                            .frame(width: 24, height: 24)
                            .overlay {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .fontWeight(.black)
                                    .foregroundStyle(Color.HPPrimary.base)
                            }
                    }
                    .buttonStyle(.plain)
                    .offset(x: 52, y: -26)
                }
            }
        }
        .onHover { value in
            if value {
                instantFeedbackManager.focusedPanel = .timer
            } else {
                // Hover Out 되었을때, 해당 위치를 UserDefaults에 넣는다.
                UserDefaults.standard.set( String(Int((panelController.panel?.frame.minX)!)), forKey: "TimerPanelX")
                UserDefaults.standard.set(String(Int((panelController.panel?.frame.minY)!)), forKey: "TimerPanelY")
                //                    print("TimerX: \(floatingPanelController.getPanelPosition()!.x)")
                //                    print("TimerY: \(floatingPanelController.getPanelPosition()!.y)")
                
                print("floatingPanelController.panel?.frame.minX: \(panelController.panel?.frame.minX)")
                print("floatingPanelController.panel?.frame.maxX: \(panelController.panel?.frame.maxX)")
                print("floatingPanelController.panel?.frame.minY: \(panelController.panel?.frame.minY)")
                print("floatingPanelController.panel?.frame.maxY: \(panelController.panel?.frame.maxY)")
                
                print("Int((NSScreen.main?.visibleFrame.height)!) - 56): \(Int((NSScreen.main?.visibleFrame.height)!) - 56))")
                
                instantFeedbackManager.focusedPanel = nil
            }
        }
        .frame(width: 132, height: 80)
    }
}
