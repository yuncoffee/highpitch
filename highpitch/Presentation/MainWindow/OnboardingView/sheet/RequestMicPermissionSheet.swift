//
//  RequestMicPermissionSheet.swift
//  highpitch
//
//  Created by yuncoffee on 11/22/23.
//

import SwiftUI

struct RequestMicPermissionSheet: View {
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: .HPSpacing.xxsmall + .HPSpacing.small) {
                header
                VStack(spacing: .HPSpacing.xxsmall) {
                    requestPermissionButton
                    dismissButton
                }
            }
        }
        .padding(.top, .HPSpacing.large)
        .padding(.bottom, .HPSpacing.small)
        .padding(.horizontal, .HPSpacing.xsmallBetweenSmall +  .HPSpacing.xxxsmall)
        .frame(width: 400)
        .background(Color.HPGray.systemWhite)
    }
}

extension RequestMicPermissionSheet {
    private func requestMicrophonePermission() {
        let workspace = NSWorkspace.shared
        let urlPath = "x-apple.systempreferences:com.apple.preference.security?Privacy_Microphone"
        if let url = URL(string: urlPath) {
            if workspace.open(url) {
                print("보안 및 개인정보 설정 중 '마이크' 섹션으로 이동되었습니다.")
            } else {
                print("설정 앱을 열 수 없습니다.")
            }
        }
    }
    
    private func dismissSheet() {
        isActive = false
    }
}

extension RequestMicPermissionSheet {
    @ViewBuilder
    var header: some View {
        VStack {
            Text("원활한 연습기록을 위해\n마이크 권한을 허용해주세요")
                .systemFont(.subTitle, weight: .bold)
                .foregroundStyle(Color.HPTextStyle.darker)
            Text("마이크 권한을 허용해주셔야\n하이피치를 정상적으로 사용할 수 있어요.")
                .systemFont(.footnote, weight: .medium)
                .foregroundStyle(Color.HPTextStyle.base)
        }
        .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    var requestPermissionButton: some View {
        HPButton(size: .large) {
            requestMicrophonePermission()
        } label: { type, size, color, expandable in
            HPLabel(
                content: ("권한 설정하러 가기", nil),
                type: type,
                size: size,
                color: color,
                expandable: expandable
            )
        }
        .frame(width: 178)
    }
    
    @ViewBuilder
    var dismissButton: some View {
        HPButton(type: .text, size: .small, color: .HPTextStyle.base) {
            dismissSheet()
        } label: { type, size, color, expandable in
            HPLabel(
                content: ("나중에 할래요", nil),
                type: type,
                size: size,
                color: color,
                expandable: expandable,
                fontStyle: .systemDetail(.footnote, .semibold)
            )
        }
        .frame(width: 178)
    }
    
}

#Preview {
    @State var isActive = false
    return RequestMicPermissionSheet(isActive: $isActive)
}
