//
//  FillerWordPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct FillerWordPanelView: View {
    var floatingPanelController: FloatingPanelController
    private let PANEL_FRAME_SIZE = 120.0
    
    var body: some View {
        let realTimeFillerCount = SystemManager.shared
            .instantFeedbackManager.speechRecognizerManager?.realTimeFillerCount ?? 0
        
        ZStack(alignment: .topTrailing) {
            VStack(spacing: .HPSpacing.xxxxsmall) {
                ForEach(0..<3) { index in
                    FillerWordStatus(
                        index: index,
                        selected: index == 2
                        ? realTimeFillerCount > 0 ? true : false
                        : index == 1
                        ? realTimeFillerCount > 1 ? true : false
                        : realTimeFillerCount > 2 ? true : false,
                        isMax: realTimeFillerCount > 2
                    )
                }
                Text("습관어")
                    .systemFont(.caption)
                    .padding(.top, .HPSpacing.xxxxsmall)
                    .foregroundColor(Color.HPGray.systemWhite.opacity(0.6))
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
                        PanelData.shared.isEditMode
                        ? (PanelData.shared.isFocused == 3
                           ? Color.HPPrimary.base
                           : Color.HPGray.systemWhite)
                        : .clear, width: 2)
                if PanelData.shared.isEditMode && PanelData.shared.isFocused == 3 {
                    Button {
                        PanelData.shared.isShow[3] = false
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
        .onTapGesture {
            PanelData.shared.isFocused = 3
        }
        .frame(width: 158, height: 158)
        .onAppear {
            #if PREVIEW
            PanelData.shared.isEditMode = true
            PanelData.shared.isFocused = 3
            SystemManager.shared
                .instantFeedbackManager.speechRecognizerManager = SpeechRecognizerManager()
            SystemManager.shared
                .instantFeedbackManager.speechRecognizerManager?.realTimeFillerCount = 3
            #endif
        }
    }
}

struct FillerWordStatus: View {
    var index: Int
    var selected: Bool
    var isMax: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: .HPCornerRadius.small)
            .fill(
                isMax
                ? Color.HPPrimary.base
                : selected
                ? Color.HPPrimary.base.opacity(0.4)
                : Color("D9D9D9").opacity(0.3)
            )
            .stroke(
                isMax
                ? Color.clear
                : selected
                ? Color.clear
                : Color.HPGray.systemWhite.opacity(0.2)
            )
            .frame(width: 44, height: 10)
    }
}

#Preview {
    FillerWordPanelView(
        floatingPanelController: FloatingPanelController(
            xPosition: Int((NSScreen.main?.frame.width)!) - 120,
            yPosition: 120,
            swidth: 132,
            sheight: 132
        )
    )
    .frame(maxWidth: 132, maxHeight: 132)
    .padding(64)
}
