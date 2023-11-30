//
//  RecordingInfoView.swift
//  highpitch
//
//  Created by 이재혁 on 11/18/23.
//

import SwiftUI

struct RecordPanelView: View {
    @State private var circleOpacity = 0.2
    
    var panelController: PanelController
    var instantFeedbackManager = SystemManager.shared.instantFeedbackManager
    
    let RECORD_PANEL_INFO = SystemManager.shared.instantFeedbackManager.RECORD_PANEL_INFO
    
    var body: some View {
        HStack(spacing:0) {
            HStack {
                Circle()
                    .opacity(circleOpacity)
                    .foregroundColor(Color.red)
                    .animation(
                        .easeInOut(duration: 1).repeatForever(),
                        value: circleOpacity
                    )
                    .frame(width:8, height: 8)
                    .onAppear {
                        circleOpacity = 1
                    }
                Text("연습을 기록중이에요")
                    .systemFont(.caption, weight: .semibold)
                    .foregroundStyle(Color.white)
            }
            .frame(width:215, height: 29)
            .background(Color("3A3241"))
            
            HStack(spacing: 0) {
                Button("연습 끝내기") {
                    instantFeedbackManager.feedbackPanelControllers[.save]?.showPanel(self)
                }
                .systemFont(.caption, weight: .semibold)
                .foregroundStyle(Color.white)
                .buttonStyle(.plain)
            }
            .frame(width:142, height: 29)
            .background(Color("75707A"))
        }
        .frame(
            width: RECORD_PANEL_INFO.size.width,
            height: RECORD_PANEL_INFO.size.height
        )
        .background(Color.clear)
        .clipShape(
            .rect(
                topLeadingRadius: 0,
                bottomLeadingRadius: 12,
                bottomTrailingRadius: 12,
                topTrailingRadius: 0
            )
        )
    }
}
