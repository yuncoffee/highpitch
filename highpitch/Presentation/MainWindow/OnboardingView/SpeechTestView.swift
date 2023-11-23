//
//  SpeechTestView.swift
//  highpitch
//
//  Created by yuncoffee on 11/20/23.
//

import SwiftUI

struct SpeechTestView: View {
    @Environment(OnboardingViewStore.self)
    var store

    @State
    private var currentSentenceIndex = 0
    
    @State
    private var testOneStatus: MySPMTestType = .testBefore
    
    @State
    private var testTwoStatus: MySPMTestType = .testBefore
    
    var body: some View {
        VStack(spacing: .zero) {
            VStack(spacing: .HPSpacing.xxsmall) {
                Text("정확한 분석을 위해 두 번의 측정을 할 거에요.")
                    .systemFont(.subTitle, weight: .bold)
                    .foregroundColor(Color.HPPrimary.dark)
                Text("실제 발표 상황이라고 생각한 후,\n제시된 스크립트를 편하게 읽어보세요!")
                    .multilineTextAlignment(.center)
                    .systemFont(.footnote, weight: .medium)
                    .foregroundColor(Color.HPTextStyle.base)
            }
            .padding(.bottom, .HPSpacing.xxlarge)
            ZStack {
                /// carousel
                HStack(spacing: .HPSpacing.small) {
                    testSentenceOne
                    testSentenceTwo
                }
                .offset(x: currentSentenceIndex == 0 ? 126 + 64 : -126 - 64)
                /// button Container
                HStack {
                    Button {
                        withAnimation {
                            currentSentenceIndex = 0
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color.HPPrimary.base)
                            .frame(width: 28, height: 28)
                            .background(Color.HPGray.systemWhite)
                            .clipShape(Circle())
                    }
                    .buttonStyle(.plain)
                    .contentShape(Circle())
                    .shadow(color: Color("000000").opacity(0.25) ,radius: 4, y: 0)
                    .opacity(currentSentenceIndex  == 1 ? 1 : 0)
                    .offset(x: .HPSpacing.medium)
                    Spacer()
                    Button {
                        withAnimation {
                            currentSentenceIndex = 1
                        }
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color.HPPrimary.base)
                            .frame(width: 28, height: 28)
                            .background(Color.HPGray.systemWhite)
                            .clipShape(Circle())
                    }
                    .buttonStyle(.plain)
                    .contentShape(Circle())
                    .shadow(color: Color("000000").opacity(0.25) ,radius: 4, y: 0)
                    .opacity(currentSentenceIndex == 0 ? 1 : 0)
                    .offset(x: -.HPSpacing.medium)
                }
                .padding(.horizontal, .HPSpacing.xxxlarge)
            }
            .padding(.bottom, .HPSpacing.xxxlarge)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .padding(.top, 72)
    }
}

extension SpeechTestView {
    @ViewBuilder
    var testSentenceOne: some View {
        VStack(spacing: .zero) {
            Text("성공의 비밀은 실패에서 배우는 데 있습니다.\n그리고 끝까지 포기하지 않는 것입니다.\n실패는 성공의 어머니이며,\n오늘의 노력이 내일의 행복을 만듭니다.")
                .multilineTextAlignment(.center)
                .systemFont(.footnote, weight: .semibold)
                .foregroundStyle(Color.HPSecondary.base)
            Spacer()
            SpeechTestButtonGroup(
                fileName:SystemManager.shared.ONBOARDING_TESTONE_FILE_NAME,
                index: 0,
                status: $testOneStatus
            )
        }
        .padding(.top, .HPSpacing.xxlarge - .HPSpacing.xsmall)
        .padding(.horizontal, .HPSpacing.xxlarge - .HPSpacing.xsmall)
        .padding(.bottom, .HPSpacing.small)
        .frame(minWidth: 352, maxWidth: 352, maxHeight: 280)
        .background(Color.HPGray.systemWhite)
        .clipShape(RoundedRectangle(cornerRadius: .HPCornerRadius.large))
        .background(
            RoundedRectangle(cornerRadius: .HPCornerRadius.large)
                .stroke(
                    currentSentenceIndex == 0
                    ? Color.HPPrimary.lighter
                    : .clear, style: .init(lineWidth: 8)
                )
        )
        .opacity(currentSentenceIndex == 0 ? 1 : 0.5)
    }
    
    @ViewBuilder
    var testSentenceTwo: some View {
        VStack {
            Text("우리의 가장 큰 위험은\n높은 목표를 세우지 않는 것이 아니라,\n낮은 목표를 달성하는 데 있습니다.")
                .multilineTextAlignment(.center)
                .systemFont(.footnote, weight: .semibold)
                .foregroundStyle(Color.HPSecondary.base)
            Spacer()
            SpeechTestButtonGroup(
                fileName:SystemManager.shared.ONBOARDING_TESTTWO_FILE_NAME,
                index: 1,
                status: $testTwoStatus
            )
        }
        .padding(.top, .HPSpacing.xxlarge - .HPSpacing.xsmall)
        .padding(.horizontal, .HPSpacing.xxlarge - .HPSpacing.xsmall)
        .padding(.bottom, .HPSpacing.small)
        .frame(minWidth: 352, maxWidth: 352, maxHeight: 280)
        .background(Color.HPGray.systemWhite)
        .clipShape(RoundedRectangle(cornerRadius: .HPCornerRadius.large))
        .background(
            RoundedRectangle(cornerRadius: .HPCornerRadius.large)
                .stroke(
                    currentSentenceIndex == 1
                    ? Color.HPPrimary.lighter
                    : .clear, style: .init(lineWidth: 8)
                )
        )
        .opacity(currentSentenceIndex == 1 ? 1 : 0.5)
    }
}

#Preview {
    SpeechTestView()
        .frame(width: 636, height: 628, alignment: .top)
}
