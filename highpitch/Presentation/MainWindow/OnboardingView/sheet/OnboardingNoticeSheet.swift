//
//  NoticeSheet.swift
//  highpitch
//
//  Created by yuncoffee on 11/23/23.
//

import SwiftUI

struct OnboardingNoticeSheet: View {
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: .HPSpacing.xxsmall + .HPSpacing.small) {
                header
                VStack(spacing: .HPSpacing.xxsmall) {
                    dismissButton
                    skipOnboardingButton
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

extension OnboardingNoticeSheet {
    private func dismissSheet() {
        isActive = false
    }
    private func skip() {
        SystemManager.shared.isPassOnbarding = true
        UserDefaults.standard.set(true, forKey: "isPassOnbarding")
    }
}

extension OnboardingNoticeSheet {
    @ViewBuilder
    var header: some View {
        VStack {
            Text("지금 말할 수 없는 상황인가요?")
                .systemFont(.subTitle, weight: .bold)
                .foregroundStyle(Color.HPTextStyle.darker)
            Text("나의 말하기 평균 속도를 측정해야\n더 정확한 분석을 받을 수 있어요.")
                .systemFont(.footnote, weight: .medium)
                .foregroundStyle(Color.HPTextStyle.base)
        }
        .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    var dismissButton: some View {
        HPButton(size: .large) {
            dismissSheet()
        } label: { type, size, color, expandable in
            HPLabel(
                content: ("측정해볼게요", nil),
                type: type,
                size: size,
                color: color,
                expandable: expandable
            )
        }
        .frame(width: 178)
    }
    
    @ViewBuilder
    var skipOnboardingButton: some View {
        HPButton(type: .text, size: .small, color: .HPTextStyle.base) {
            skip()
        } label: { type, size, color, expandable in
            HPLabel(
                content: ("괜찮아요, 다음에 할게요", nil),
                type: type,
                size: size,
                color: color,
                expandable: expandable,
                fontStyle: .systemDetail(.footnote, .semibold)
            )
        }
        .frame(width: 178)
        .underline()
    }
}

#Preview {
    @State var isActive = false
    return OnboardingNoticeSheet(isActive: $isActive)
}
