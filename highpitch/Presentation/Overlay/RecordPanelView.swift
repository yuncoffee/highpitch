//
//  RecordingInfoView.swift
//  highpitch
//
//  Created by 이재혁 on 11/18/23.
//

import SwiftUI

struct RecordPanelView: View {
    var panelController: PanelController
    var instantFeedbackManager = SystemManager.shared.instantFeedbackManager
    
    var body: some View {
        HStack(spacing:0) {
            HStack {
                Circle()
                    .foregroundColor(Color.red)
                    .frame(width:8, height: 8)
                Text("연습을 기록중이에요")
                    .systemFont(.caption, weight: .semibold)
                    .foregroundStyle(Color.white)
            }
            .frame(width:215, height: 29)
            .background(Color("3A3241"))
            
            HStack(spacing: 0) {
                Button("연습 끝내기") {
                    print("연습 끝내기")
                    instantFeedbackManager.feedbackPanelControllers[.save]?.showPanel(self)
                }
                .systemFont(.caption, weight: .semibold)
                .foregroundStyle(Color.white)
                .buttonStyle(.plain)
            }
            .frame(width:142, height: 29)
            .background(Color("FFFFFF").opacity(0.4))
        }
        .frame(width: 357, height: 29)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous)) // Add clipShape here
        
    }
}
