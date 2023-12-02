//
//  RequestDictationView.swift
//  highpitch
//
//  Created by musung on 11/29/23.
//

import SwiftUI

struct RequestMicPermissionView: View {
    @Environment(ProjectManager.self)
    private var projectManager
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image(systemName: "exclamationmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundStyle(Color.HPGray.system400)
                .padding(.top,.HPSpacing.large)
                .padding(.bottom,.HPSpacing.xsmall)
            Text("마이크 설정을 활성화해주세요!")
                .systemFont(.subTitle, weight: .bold)
                .foregroundColor(Color.HPTextStyle.darker)
                .padding(.bottom,.HPSpacing.xxxsmall)
            Text("연습을 기록하기 위해 음성을 기록해야합니다.")
                .systemFont(.caption, weight: .regular)
                .foregroundColor(Color.HPTextStyle.base)
            Text("시스템 설정 - 마이크에서 음성 권한을 허용해주세요")
                .systemFont(.caption, weight: .regular)
                .foregroundColor(Color.HPTextStyle.base)
                .padding(.bottom,.HPSpacing.small)
            HStack {
                HPButton(type: .blockFill(8), size: .large, color: .HPGray.system200) {
                    projectManager.isMicRecordpermitted = false
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
                    projectManager.isMicRecordpermitted = false
                    openMicPermission()
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
extension RequestMicPermissionView {
    func openMicPermission() {
        if  let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Microphone")  {
            NSWorkspace.shared.open(url)
        }
    }
}
