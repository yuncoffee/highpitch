//
//  SpeechTestView.swift
//  highpitch
//
//  Created by yuncoffee on 11/20/23.
//

import SwiftUI

struct SpeechTestView: View {
    @State
    private var currentSentenceIndex = 0
    
    @State
    private var testOneStatus = 0
    
    @State
    private var testTwoStatus = 0
    
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
            SpeechTestButtonGroup(status: $testOneStatus)
        }
        .padding(.top, .HPSpacing.xxlarge - .HPSpacing.xsmall)
        .padding(.horizontal, .HPSpacing.xxlarge - .HPSpacing.xsmall)
        .padding(.bottom, .HPSpacing.small)
        .frame(minWidth: 352, maxWidth: 352, maxHeight: 280)
        .background(Color.HPGray.systemWhite)
        .clipShape(RoundedRectangle(cornerRadius: .HPCornerRadius.large))
        .background(
            RoundedRectangle(cornerRadius: .HPCornerRadius.large)
                .stroke(currentSentenceIndex == 0 ?Color.HPPrimary.lighter : .clear, style: .init(lineWidth: 8))
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
            SpeechTestButtonGroup(status: $testTwoStatus)
        }
        .padding(.top, .HPSpacing.xxlarge - .HPSpacing.xsmall)
        .padding(.horizontal, .HPSpacing.xxlarge - .HPSpacing.xsmall)
        .padding(.bottom, .HPSpacing.small)
        .frame(minWidth: 352, maxWidth: 352, maxHeight: 280)
        .background(Color.HPGray.systemWhite)
        .clipShape(RoundedRectangle(cornerRadius: .HPCornerRadius.large))
        .background(
            RoundedRectangle(cornerRadius: .HPCornerRadius.large)
                .stroke(currentSentenceIndex == 1 ?Color.HPPrimary.lighter : .clear, style: .init(lineWidth: 8))
        )
        .opacity(currentSentenceIndex == 1 ? 1 : 0.5)
    }
}

struct SpeechTestButtonGroup: View {
    @Binding var status: Int
    
    @State
    private var isAudioRecord = false
    @State
    private var isAudioPlay = false
    @State 
    private var animationsRunning = false

    var body: some View {
        if status == 0 {
            HPButton(type: .blockFill(.HPCornerRadius.medium), size: .large, color: .HPPrimary.base) {
                withAnimation {
                    status = 1
                }
            } label: { type, size, color, expandable in
                HPLabel(
                    content: ("해당 문장 읽기", nil),
                    type: type,
                    size: size,
                    color: color,
                    expandable: expandable
                )
            }
            .frame(maxWidth: 178)
            .padding(.bottom, .HPSpacing.small)
        } else if status == 1 {
            VStack {
                HStack {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .foregroundStyle(Color.HPPrimary.base)
                        .symbolEffect(.variableColor.iterative, options: .repeating, value: animationsRunning)
                }
                .frame(maxWidth: 178, maxHeight: 40)
                .background(Color.HPGray.system200)
                .clipShape(RoundedRectangle(cornerRadius: .HPCornerRadius.medium))
                HPButton(type: .text, size: .small, color: .HPPrimary.dark) {
                    status = 2
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: ("다 읽었어요", "arrow.clockwise"),
                        type: type,
                        size: size,
                        color: color,
                        alignStyle: .iconWithText,
                        expandable: expandable,
                        fontStyle: .systemDetail(.caption, .semibold)
                    )
                }
                .frame(maxWidth: 178)
                .background(
                    Rectangle()
                        .fill(Color.HPPrimary.base)
                        .frame(width: 64, height: 2)
                        .offset(x: 10, y: 10)
                )
            }
            .onAppear {
                withAnimation {
                    animationsRunning = true
                }
            }
            .onDisappear {
                animationsRunning = false
            }
        } else {
            VStack {
                HPButton(
                    type: .blockFill(.HPCornerRadius.medium),
                    size: .large,
                    color: isAudioPlay ? .HPPrimary.lightnest : .HPPrimary.base) {
                    isAudioPlay = true
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: ("녹음 들어보기", nil),
                        type: type,
                        size: size,
                        color: color,
                        contentColor: isAudioPlay
                        ? .HPTextStyle.light
                        : .HPGray.systemWhite,
                        expandable: expandable
                    )
                }
                .frame(maxWidth: 178)
                .disabled(isAudioPlay)
                HPButton(type: .text, size: .small, color: .HPTextStyle.light) {
                    status = 1
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: ("다시 녹음할래요", "arrow.clockwise"),
                        type: type,
                        size: size,
                        color: color,
                        alignStyle: .iconWithText,
                        expandable: expandable, 
                        fontStyle: .systemDetail(.caption, .semibold)
                    )
                }
                .frame(maxWidth: 178)
                .background(
                    Rectangle()
                        .fill(Color.HPTextStyle.light)
                        .frame(width: 90, height: 1)
                        .offset(x: 10, y: 10)
                )
            }
            .onDisappear {
                isAudioPlay = false
            }
        }
    }
}

#Preview {
    SpeechTestView()
        .frame(width: 636, height: 628, alignment: .top)
}
