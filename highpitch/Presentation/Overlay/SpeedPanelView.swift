//
//  SpeedPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct SpeedPanelView: View {
    var floatingPanelController: FloatingPanelController
    private let PANEL_FRAME_SIZE = 120.0
    private let DEFUALT_SPEED = 300.0
    
    private var realTimeRate: Double {
        SystemManager.shared.instantFeedbackManager.speechRecognizerManager?.realTimeRate ?? 0
    }
    
    private var underSpeedRate: Double {
        calcSpeedRate(rate: DEFUALT_SPEED - 100.0)
    }
    
    private var overSpeedRate: Double {
        calcSpeedRate(rate: DEFUALT_SPEED + 100.0)
    }
    
    var body: some View {
        VStack {
            VStack(spacing: .zero) {
                ZStack {
                    speedIndicatorTrack()
                    speedIndicator(percent: calcSpeedRate(rate: realTimeRate))
                    Image(
                        systemName: calcSpeedRate(rate: realTimeRate) < underSpeedRate
                        ? "tortoise.fill"
                        : calcSpeedRate(rate: realTimeRate) > overSpeedRate
                        ? "hare.fill"
                        : "microbe.fill"
                    )
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(
                        calcSpeedRate(rate: realTimeRate) < underSpeedRate
                        ? Color("22D71E")
                        : calcSpeedRate(rate: realTimeRate) > overSpeedRate
                        ? Color("FF9500")
                        : Color("FFFFFF").opacity(0.2)
                    )
                    .frame(width: 24, height: 24)
                    .symbolEffect(.bounce, value: realTimeRate)
                    .opacity(calcSpeedRate(rate: realTimeRate) > underSpeedRate && calcSpeedRate(rate: realTimeRate) < overSpeedRate ? 0 : 1)
                    Text("말 빠르기")
                        .systemFont(.caption)
                        .foregroundColor(Color.HPGray.systemWhite.opacity(0.6))
                        .offset(y: 24)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.HPGray.systemBlack.opacity(0.4))
            .background(.ultraThinMaterial)
            .edgesIgnoringSafeArea(.all)
            .clipShape(RoundedRectangle(cornerRadius: .HPCornerRadius.large))
        }
        .opacity(realTimeRate > DEFUALT_SPEED + 100 || realTimeRate < DEFUALT_SPEED - 100 ? 1 : 0.3)
        .frame(width: PANEL_FRAME_SIZE, height: PANEL_FRAME_SIZE)
        .overlay {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: .HPCornerRadius.large)
                    .stroke(Color.HPGray.systemWhite.opacity(0.1))
                    .frame(width: PANEL_FRAME_SIZE, height: PANEL_FRAME_SIZE)
                    .padding(6)
                    .border(
                        SystemManager.shared.instantFeedbackManager.isFocused == .speed
                           ? Color.HPPrimary.base
                           : Color.clear, width: 2)
                if SystemManager.shared.instantFeedbackManager.isFocused == .speed {
                    Button {
                        if SystemManager.shared.instantFeedbackManager.activePanels.contains(InstantPanel.speed) {
                            SystemManager.shared.instantFeedbackManager.activePanels.remove(InstantPanel.speed)
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
        .onHover { value in
            if value {
                SystemManager.shared.instantFeedbackManager.isFocused = .speed
            } else {
                SystemManager.shared.instantFeedbackManager.isFocused = nil
            }
        }
        .frame(width: 158, height: 158)
        .onAppear {
            #if PREVIEW
//            PanelData.shared.isEditMode = true
//            PanelData.shared.isFocused = 2
            SystemManager.shared
                .instantFeedbackManager.speechRecognizerManager = SpeechRecognizerManager()
            SystemManager.shared
                .instantFeedbackManager.speechRecognizerManager?.realTimeFillerCount = 3
            #endif
        }
    }
}

extension SpeedPanelView {
    private func calcSpeedRate(rate: Double) -> Double {
        var result = rate / (DEFUALT_SPEED * 4 / 100)
        return result < 0 ? 0 : result > 50 ? 50 : result
    }
}

extension SpeedPanelView {
    func speedIndicator(percent: Double = 25) -> some View {
        RingShape(
            percent: percent,
            startAngle: 180,
            drawnClockwise: false
        )
        .stroke(style: StrokeStyle(lineWidth: 14, lineCap: .round))
        .fill(
            percent < underSpeedRate
            ? Color("22D71E")
            : percent > overSpeedRate
            ? Color("FF9500")
            : Color("FFFFFF").opacity(0.2)
        )
        .frame(width: 68, height: 68)
        .animation(.bouncy, value: realTimeRate)
    }
    func speedIndicatorTrack() -> some View {
        RingShape(
            percent: 50,
            startAngle: 180,
            drawnClockwise: false
        )
        .stroke(style: StrokeStyle(lineWidth: 14, lineCap: .round))
        .fill(Color("000000").opacity(0.1))
        .frame(width: 68, height: 68)
        .overlay {
            RingShape(
                percent: 50,
                startAngle: 180,
                drawnClockwise: false
            )
            .stroke(style: StrokeStyle(lineWidth: 14, lineCap: .round))
            .fill(Color("FFFFFF").opacity(0.2))
            .frame(width: 69, height: 69)
        }
    }
}

#Preview {
    SpeedPanelView(
        floatingPanelController:
            FloatingPanelController(
                xPosition: -120,
                yPosition: 120,
                swidth: 132,
                sheight: 132
            )
    )
    .frame(maxWidth: 132, maxHeight: 132)
    .padding(64)
}
