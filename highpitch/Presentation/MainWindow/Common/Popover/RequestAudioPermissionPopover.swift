//
//  RequestAudioPermissionPopover.swift
//  highpitch
//
//  Created by yuncoffee on 11/7/23.
//

import SwiftUI

struct RequestAudioPermissionPopover: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                SystemManager.shared.isRequsetAudioPermissionPopoverActive = false
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
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Image(.hpLogo)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 50)
                        Text("에서")
                            .systemFont(.largeTitle)
                            .foregroundStyle(Color.HPTextStyle.darker)
                            .offset(y: .HPSpacing.xxxxsmall)
                    }
                    Text("마이크를 통해 연습을 기록하려고 합니다.")
                        .systemFont(.largeTitle)
                        .foregroundStyle(Color.HPTextStyle.darker)
                }
                Text("시스템 환경설정에 있는 보안 및 개인 정보 보호에서\n이 응용프로그램에 접근 권한을 허용해주세요.")
                    .systemFont(.footnote)
                    .foregroundStyle(Color.HPTextStyle.dark)
                    .multilineTextAlignment(.center)
                HPButton(type: .blockFill(8), size: .medium, color: .HPPrimary.dark) {
                    /// 개인정보 보호 및 보안 바로가기
                    /// import Cocoa
                    let workspace = NSWorkspace.shared
                    if let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Microphone") {
                        if workspace.open(url) {
                            print("보안 및 개인정보 설정 중 '마이크' 섹션으로 이동되었습니다.")
                        } else {
                            print("설정 앱을 열 수 없습니다.")
                        }
                    }

                } label: { type, size, color, expandable in
                    HPLabel(
                        content: (label: "개인정보 보호 및 보안 바로가기", icon: nil),
                        type: type,
                        size: size,
                        color: color,
                        expandable: expandable
                    )
                }
                .frame(width: 228)
                Image(.audioSetting)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 335)
                    .offset(y: 8)
                
            }
            .padding(.horizontal, .HPSpacing.small)
            .frame(width: 1000, height: 628, alignment: .bottom)

        }
    }
}

#Preview {
    RequestAudioPermissionPopover()
}
