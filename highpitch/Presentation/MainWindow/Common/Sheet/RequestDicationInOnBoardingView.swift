//
//  RequestDictationView.swift
//  highpitch
//
//  Created by musung on 11/29/23.
//

import SwiftUI

struct RequestDictationInOnBoardingView: View {
    @Binding
    var isDictationUnavailable: Bool
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image(systemName: "exclamationmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundStyle(Color.HPGray.system400)
                .padding(.top,.HPSpacing.large)
                .padding(.bottom,.HPSpacing.xsmall)
            Text("받아쓰기 설정을 활성화 해주세요!")
                .systemFont(.subTitle, weight: .bold)
                .foregroundColor(Color.HPTextStyle.darker)
                .padding(.bottom,.HPSpacing.xxxsmall)
            Text("음성을 텍스트로 변환해서 코칭해드려야해요!")
                .systemFont(.caption, weight: .regular)
                .foregroundColor(Color.HPTextStyle.base)
            Text("시스템 설정 - 키보드에서 받아쓰기를 시작해주세요.")
                .systemFont(.caption, weight: .regular)
                .foregroundColor(Color.HPTextStyle.base)
                .padding(.bottom,.HPSpacing.small)
            HStack {
                HPButton(type: .blockFill(8), size: .large, color: .HPGray.system200) {
                    isDictationUnavailable = false
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: (label: "연습 그만두기", icon: nil),
                        type: type,
                        size: size,
                        color: color,
                        contentColor: .HPTextStyle.darker,
                        expandable: expandable
                    )
                }
                .frame(width: 144)
                HPButton(type: .blockFill(8), size: .large, color: .HPPrimary.base) {
                    isDictationUnavailable = false
                    openKeyboardSettings()
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: (label: "권한 설정하러 가기", icon: nil),
                        type: type,
                        size: size,
                        color: color,
                        expandable: expandable
                    )
                }
                .frame(width: 144)
            }
            Spacer()
        }.frame(width: 420, height: 280)
    }
}
extension RequestDictationInOnBoardingView {
    func openKeyboardSettings() {
        if let url = URL(string: "x-apple.systempreferences:com.apple.preference.keyboard") {
            NSWorkspace.shared.open(url)
        }
    }
}
