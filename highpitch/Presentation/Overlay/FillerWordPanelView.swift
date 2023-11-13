//
//  FillerWordPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct FillerwordPanelView: View {
    var floatingPanelController: FloatingPanelController

    var body: some View {
        let realTimeFillerCount = SystemManager.shared
            .instantFeedbackManager.speechRecognizerManager?.realTimeFillerCount ?? 0
        
        VStack(spacing: .HPSpacing.xxxxsmall) {
            ForEach(0..<3) { index in
                FillerWordStatus(
                    index: index,
                    selected: index == 2
                    ? realTimeFillerCount > 0 ? true : false
                    : index == 1
                    ? realTimeFillerCount > 1 ? true : false
                    : realTimeFillerCount > 2 ? true : false
                )
            }
            Text("습관어")
                .systemFont(.caption)
                .padding(.top, .HPSpacing.xxxxsmall)
                .foregroundColor(Color("FFFFFF").opacity(0.6))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4))
        .edgesIgnoringSafeArea(.all)
        .border(PanelData.shared.isEditMode
                ? (PanelData.shared.isFocused == 3
                ? .purple : .white) : .clear, width: 2)
        .onTapGesture {
            PanelData.shared.isFocused = 3
        }
    }
}

struct FillerWordStatus: View {
    var index: Int
    var selected: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: .HPCornerRadius.small)
            .fill(
                selected
                ? Color("8B6DFF").opacity(0.4)
                : Color("D9D9D9").opacity(0.3)
            )
            .stroke(
                selected
                ? Color("FFFFFF").opacity(0.2)
                : Color.clear
            )
            .frame(width: 44, height: 10)
    }
}
