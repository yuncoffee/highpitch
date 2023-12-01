//
//  MainWindowPracticeSaveSheet.swift
//  highpitch
//
//  Created by yuncoffee on 11/24/23.
//

import SwiftUI

struct MainWindowPracticeSaveSheet: View {
    var instantFeedbackManager = SystemManager.shared.instantFeedbackManager
    
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
            
            VStack(alignment: .center, spacing: .HPSpacing.xxsmall + .HPSpacing.xxxsmall) {
                VStack(spacing: .HPSpacing.xxsmall) {
                    Text("연습 기록을 저장하시겠어요?")
                        .systemFont(.subTitle, weight: .bold)
                        .foregroundStyle(Color.HPTextStyle.dark)
                    Text("저장하지 않은 연습은 기록되지 않아,\n피드백을 확인할 수 없어요.")
                        .systemFont(.caption)
                        .foregroundStyle(Color.HPTextStyle.base)
                        .multilineTextAlignment(.center)
                }
                HStack {
                    HPButton(type: .blockFill(8), size: .large, color: .HPGray.system200) {
                        // 연습 저장 X, 녹음 종료 및 생성된 비디오, 오디오 삭제
                        SystemManager.shared.notSavePractice()
                        // TimerPanel의 타이머 정지 및 초기화
                        SystemManager.shared.instantFeedbackManager.isTimerRunning = -1
                        // NotificationCenter.default.post(name: Notification.Name("cancelButtonClicked"), object: true)
                        NotificationCenter.default.post(name: Notification.Name("stopButtonClicked"), object: true)
                        instantFeedbackManager.feedbackPanelControllers[.save]?.hidePanel(self)
                        instantFeedbackManager.feedbackPanelControllers[.detailSetting]?.hidePanel(self)
                        
                        SystemManager.shared.isMainWindowPracticeSaveSheetActive = false
                    } label: { type, size, color, expandable in
                        HPLabel(
                            content: (label: "저장하지 않기", icon: nil),
                            type: type,
                            size: size,
                            color: color,
                            contentColor: .HPTextStyle.darker,
                            expandable: expandable
                        )
                    }
                    .frame(width: 144)
                    HPButton(type: .blockFill(8), size: .large, color: .HPPrimary.base) {
                        // 연습 저장하는 로직
                        SystemManager.shared.stopPractice()
                        // TimerPanel의 타이머 정지 및 초기화
                        SystemManager.shared.instantFeedbackManager.isTimerRunning = -1
                        NotificationCenter.default.post(name: Notification.Name("stopButtonClicked"), object: true)
                        instantFeedbackManager.feedbackPanelControllers[.save]?.hidePanel(self)
                        instantFeedbackManager.feedbackPanelControllers[.detailSetting]?.hidePanel(self)
                    } label: { type, size, color, expandable in
                        HPLabel(
                            content: (label: "연습 저장하기", icon: nil),
                            type: type,
                            size: size,
                            color: color,
                            expandable: expandable
                        )
                    }
                    .frame(width: 144)
                }
                .padding(.vertical, .HPSpacing.medium + .HPSpacing.xxxxsmall)
            }
            .padding(.horizontal, .HPSpacing.small)
            .frame(width: 420, height: 280)

        }
    }
}

#Preview {
    MainWindowPracticeSaveSheet()
}
