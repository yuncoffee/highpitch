//
//  SpeedPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct SpeedPanelView: View {
    var floatingPanelController: PanelController
    private let PANEL_FRAME_SIZE = 120.0
    private let DEFUALT_SPEED = 300.0
    
    private var realTimeRate: Double {
        SystemManager.shared.instantFeedbackManager.speechRecognizerManager?.realTimeRate ?? 0
    }
    
    private var flagCount: Int {
        SystemManager.shared.instantFeedbackManager.speechRecognizerManager?.flagCount ?? 0
    }
    
    private var underSpeedRate: Double {
        calcSpeedRate(rate: DEFUALT_SPEED - 80.0)
    }
    
    private var overSpeedRate: Double {
        calcSpeedRate(rate: DEFUALT_SPEED + 120.0)
    }
    
    @State
    private var blinkStatus = false {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.blinkStatus = false
            }
        }
    }
    
    var body: some View {
        VStack {
            VStack(spacing: .zero) {
                ZStack {
                    speedIndicatorTrack()
                    speedIndicator(percent: calcSpeedRate(rate: realTimeRate))
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
        .frame(width: PANEL_FRAME_SIZE, height: PANEL_FRAME_SIZE)
        .overlay {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: .HPCornerRadius.large)
                    .stroke(Color.HPGray.systemWhite.opacity(0.1))
                    .frame(width: PANEL_FRAME_SIZE, height: PANEL_FRAME_SIZE)
                    .padding(6)
                    .border(
                        SystemManager.shared.instantFeedbackManager.focusedPanel == .speed
                           ? Color.HPPrimary.base
                           : Color.clear, width: 2)
                if SystemManager.shared.instantFeedbackManager.focusedPanel == .speed {
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
                SystemManager.shared.instantFeedbackManager.focusedPanel = .speed
            } else {
                // Hover Out 되었을때, 해당 위치를 UserDefaults에 넣는다.
                UserDefaults.standard.set( String(Int(floatingPanelController.getPanelPosition()!.x)), forKey: "SpeedPanelX")
                UserDefaults.standard.set(String(Int(floatingPanelController.getPanelPosition()!.y)), forKey: "SpeedPanelY")
                
                SystemManager.shared.instantFeedbackManager.focusedPanel = nil
            }
            // floatingPanelController.panel?.setFrameOrigin(NSPoint(x: 500, y: 500))
            
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
        .onChange(of: realTimeRate) { _, newValue in
            var percent = calcSpeedRate(rate: newValue)
            if percent < underSpeedRate && flagCount == -2 || percent > overSpeedRate && flagCount == 2 {
                blinkStatus = true
            }
        }
    }
}

extension SpeedPanelView {
    private func calcSpeedRate(rate: Double) -> Double {
        let result = rate / (DEFUALT_SPEED * 4 / 100)
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
            percent < underSpeedRate && flagCount < -2
            ? (blinkStatus ? Color.HPOrange.base : Color.HPOrange.light)
            : percent > overSpeedRate && flagCount > 2
            ? (blinkStatus ? Color.HPOrange.base : Color.HPOrange.light)
            : Color.HPGreen.base
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
            PanelController(
                xPosition: -120,
                yPosition: 120,
                swidth: 132,
                sheight: 132
            )
    )
    .frame(maxWidth: 132, maxHeight: 132)
    .padding(64)
}
