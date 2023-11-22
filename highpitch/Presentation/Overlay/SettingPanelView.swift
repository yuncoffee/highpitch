//
//  SettingPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct SettingPanelView: View {
    var panelController: PanelController
    var instantFeedbackManager = SystemManager.shared.instantFeedbackManager
    
    let SETTING_PANEL_INFO = SystemManager.shared.instantFeedbackManager.SETTING_PANEL_INFO
    let MSG_WIDTH = SystemManager.shared.instantFeedbackManager.SETTING_PANEL_HOVER_MSG_WIDTH
    let MSG_HEIGHT = SystemManager.shared.instantFeedbackManager.SETTING_PANEL_HOVER_MSG_HEIGHT
    let MSG_DISTANCE = SystemManager.shared.instantFeedbackManager.SETTING_PANEL_DISTANCE
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(
                        width: SETTING_PANEL_INFO.size.width,
                        height: SETTING_PANEL_INFO.size.height
                    )
                    .foregroundStyle(Color.white.opacity(0.01))
                Image(systemName: "rectangle.3.group.fill")
                    .resizable()
                    .frame(
                        width: SETTING_PANEL_INFO.size.width,
                        height: SETTING_PANEL_INFO.size.height
                    )
                    .foregroundColor(
                        instantFeedbackManager.isDetailSettingActive ? Color("FFFFFF").opacity(0.5) :
                            (instantFeedbackManager.focusedPanel == .setting ?
                                .white.opacity(0.5) : .white.opacity(0.15)
                            )
                    )
            }
            .frame(
                width: SETTING_PANEL_INFO.size.width,
                height: SETTING_PANEL_INFO.size.height
            )
        }
        .overlay {
            ZStack(alignment: .topTrailing) {
                if instantFeedbackManager.focusedPanel == .setting
                    && instantFeedbackManager.isDetailSettingActive == false {
                    Text("피드백 레이아웃 편집하기")
                        .font(Font.custom("Pretendard", size: 10))
                        .frame(width: MSG_WIDTH, height: MSG_HEIGHT)
                        .foregroundStyle(Color.white)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .offset(x: 0, y: MSG_DISTANCE + MSG_HEIGHT)
                }
            }
        }
        .onHover { value in
            if value {
                instantFeedbackManager.focusedPanel = .setting
            } else {
                instantFeedbackManager.focusedPanel = nil
            }
        }
        .onTapGesture {
            instantFeedbackManager.isDetailSettingActive.toggle()
            // instantFeedbackManager.focusedPanel = .setting
            print("편집기능: \(SystemManager.shared.instantFeedbackManager.isDetailSettingActive)")
        }
        .frame(
            width:
                instantFeedbackManager.getTotalFrameWidth(
                    width: SETTING_PANEL_INFO.size.width,
                    padding: (MSG_WIDTH - SETTING_PANEL_INFO.size.width) / 2
                ),
            height:
                instantFeedbackManager.getTotalFrameHeight(
                    height: SETTING_PANEL_INFO.size.height,
                    padding: MSG_HEIGHT + MSG_DISTANCE
                )
        )
    }
}
