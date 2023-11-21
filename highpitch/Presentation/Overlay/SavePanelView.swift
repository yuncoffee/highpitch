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
    
    var body: some View {
        VStack {
            VStack(alignment: .listRowSeparatorTrailing) {
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
                
            }
            
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
            
            HStack(alignment: .center) {
                HPButton(color: .HPGray.system200) {
                    instantFeedbackManager.feedbackPanelControllers[.save]?.hidePanel(self)
                } label: { type, size, color, expandable in
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
                    print("NSPanel에서 연습 저장하기 버튼을 눌렀다.")
                    SystemManager.shared.stopPractice()
                    NotificationCenter.default.post(name: Notification.Name("stopButtonClicked"), object: true)
                    instantFeedbackManager.feedbackPanelControllers[.save]?.hidePanel(self)
                    
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: (label: "연습 저장하기", icon: nil),
                        type: type,
                        size: .large,
                        color: color,
                        expandable: expandable,
                        fontStyle: .system(.caption),
                        padding: (v:34, h:8.5)
                    )
                }
                .frame(width: 144)
            }
        }
        .frame(width: 420, height: 280)
        .background(Color.white)
    }
}
