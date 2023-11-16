//
//  TimerPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct TimerPanelView: View {
    var floatingPanelController: PanelController
    
    @State private var timer: Timer? = nil
    @State private var elapsedTime: TimeInterval = 0.0
    @State private var isTimerRunning = false
    
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
            .background(.ultraThinMaterial)
            .edgesIgnoringSafeArea(.all)
            .clipShape(RoundedRectangle(cornerRadius: .HPCornerRadius.large))
            .onHover { value in
                if value {
                    SystemManager.shared.instantFeedbackManager.focusedPanel = .timer
                } else {
                    // Hover Out 되었을때, 해당 위치를 UserDefaults에 넣는다.
                    UserDefaults.standard.set( String(Int(floatingPanelController.getPanelPosition()!.x)), forKey: "TimerPanelX")
                    UserDefaults.standard.set(String(Int(floatingPanelController.getPanelPosition()!.y)), forKey: "TimerPanelY")
                    
                    SystemManager.shared.instantFeedbackManager.focusedPanel = nil
                }
            }
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
        .frame(width: 104, height: 56)
        .padding(18)
        .overlay {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: .HPCornerRadius.large)
                    .stroke(Color.HPGray.systemWhite.opacity(0.1))
                    .frame(width: 104, height: 56)
                    .padding(6)
                    .border(
                        SystemManager.shared.instantFeedbackManager.focusedPanel == .timer
                        ? Color.HPPrimary.base
                        : Color.clear, width: 2)
                if SystemManager.shared.instantFeedbackManager.focusedPanel == .timer {
                    Button {
                        if SystemManager.shared.instantFeedbackManager.activePanels.contains(InstantPanel.timer) {
                            SystemManager.shared.instantFeedbackManager.activePanels.remove(InstantPanel.timer)
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
                    .offset(x: 10, y: -10)
                }
            }
        }
    }
}
