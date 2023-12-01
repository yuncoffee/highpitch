//
//  RequestDictationView.swift
//  highpitch
//
//  Created by musung on 11/29/23.
//

import SwiftUI

struct RequestDictationView: View {
    @Environment(MediaManager.self)
    private var mediaManager
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
            Text("음성 변환이 불가능해, 코칭할 수 없어요!")
                .systemFont(.caption, weight: .regular)
                .foregroundColor(Color.HPTextStyle.base)
            Text("시스템 설정 - 키보드에서 받아쓰기를 시작해주세요.")
                .systemFont(.caption, weight: .regular)
                .foregroundColor(Color.HPTextStyle.base)
                .padding(.bottom,.HPSpacing.small)
            HStack {
                HPButton(type: .blockFill(8), size: .large, color: .HPGray.system200) {
                    mediaManager.isDictationUnavailable = false
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
                    mediaManager.isDictationUnavailable = false
                    openKeyboardSettings()
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: (label: "설정으로 이동하기", icon: nil),
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
extension RequestDictationView {
    func openKeyboardSettings() {
        if let url = URL(string: "x-apple.systempreferences:com.apple.preference.keyboard") {
            NSWorkspace.shared.open(url)
        }
    }
}
#Preview {
    RequestDictationView()
}
