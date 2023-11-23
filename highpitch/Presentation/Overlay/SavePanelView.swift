//
//  SavePanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/18/23.
//

import SwiftUI

struct SavePanelView: View {
    var panelController: PanelController
    var instantFeedbackManager = SystemManager.shared.instantFeedbackManager
    
    let SAVE_PANEL_INFO = SystemManager.shared.instantFeedbackManager.SAVE_PANEL_INFO
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                HStack {
                    Button {
                        instantFeedbackManager.feedbackPanelControllers[.save]?.hidePanel(self)
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundStyle(Color.HPGray.system600)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.trailing, 17)
            }
            .padding(.top, 16)
            
            Spacer()
            
            VStack {
                Text("연습 기록을 저장하시겠어요?")
                    .systemFont(.subTitle,weight: .bold)
                    .foregroundStyle(Color.HPTextStyle.darker)
                VStack(spacing: 0) {
                    Text("저장하지 않은 연습은 기록되지 않아,")
                        .systemFont(.caption,weight: .regular)
                        .foregroundStyle(Color.HPTextStyle.base)
                    Text("피드백을 확인할 수 없어요.")
                        .systemFont(.caption,weight: .regular)
                        .foregroundStyle(Color.HPTextStyle.base)
                }
            }
            
            Spacer()
            
            HStack(alignment: .center) {
                HPButton(color: .HPGray.system200) {
                    instantFeedbackManager.feedbackPanelControllers[.save]?.hidePanel(self)
                } label: { type, _, color, expandable in
                    HPLabel(
                        content: (label: "저장하지 않기", icon: nil),
                        type: type,
                        size: .large,
                        color: color,
                        contentColor: .black,
                        expandable: expandable,
                        fontStyle: .systemDetail(.caption, .semibold),
                        padding: (v:34, h:8.5)
                    )
                }
                .frame(width: 144)
                
                HPButton(color: .HPPrimary.base) {
                    // 연습 저장하는 로직
                    SystemManager.shared.stopPractice()
                    // TimerPanel의 타이머 정지 및 초기화
                    SystemManager.shared.instantFeedbackManager.isTimerRunning = -1
                    NotificationCenter.default.post(name: Notification.Name("stopButtonClicked"), object: true)
                    instantFeedbackManager.feedbackPanelControllers[.save]?.hidePanel(self)
                } label: { type, _, color, expandable in
                    HPLabel(
                        content: (label: "연습 저장하기", icon: nil),
                        type: type,
                        size: .large,
                        color: color,
                        expandable: expandable,
                        fontStyle: .systemDetail(.caption, .semibold),
                        padding: (v:34, h:8.5)
                    )
                }
                .frame(width: 144)
            }
            .padding(.bottom, 35)
        }
        .frame(width: SAVE_PANEL_INFO.size.width, height: SAVE_PANEL_INFO.size.height)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        
    }
}
