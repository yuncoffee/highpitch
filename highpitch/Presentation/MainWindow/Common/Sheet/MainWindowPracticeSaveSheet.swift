//
//  MainWindowPracticeSaveSheet.swift
//  highpitch
//
//  Created by yuncoffee on 11/24/23.
//

import SwiftUI

struct MainWindowPracticeSaveSheet: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                SystemManager.shared.isMainWindowPracticeSaveSheetActive = false
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                    .foregroundStyle(Color.HPGray.system800)
            }
            .buttonStyle(.plain)
            .frame(width: 28, height: 28)
            .offset(x: -16, y: 16)
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
                        print("연습 저장하기")
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
