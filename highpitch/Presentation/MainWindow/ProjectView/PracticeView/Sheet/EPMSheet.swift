//
//  EPMSheet.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI

struct EPMSheet: View {
    @Binding
    var isSpeedTooltipActive: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                isSpeedTooltipActive = false
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
            VStack(alignment: .leading, spacing: .HPSpacing.small) {
                VStack(alignment: .leading, spacing: .HPSpacing.xxxsmall) {
                    Text("\'EPM\'이란?")
                        .systemFont(.footnote, weight: .bold)
                        .foregroundStyle(Color.HPPrimary.base)
                    // swiftlint: disable line_length
                    HStack(spacing: 0) {
                        Text("하이피치에서는")
                        + Text("EPM(분 당 음절 수)").bold()
                        + Text("즉 1분")
                        + Text("동안 얼마나 많은 음절을 발음 했는지를 기준으로 말 빠르기를 측정해요. 한국어의 경우는 단어의 구분이 모호할 때가 있어")
                        + Text(" 단어보다 음절 수로 측정하는 것이 더 용이").bold()
                        + Text("하기 때문에, EPM(분 당 음절 수) 기반 분석이 말 빠르기를 개선하는 데에 유용한 도구로 사용될 수 있어요.")
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .systemFont(.caption)
                    .foregroundStyle(Color.HPTextStyle.darker)
                    // swiftlint: enable line_length
                }
                VStack(alignment: .leading, spacing: .HPSpacing.xxxsmall) {
                    Text("왜 말 빠르기가 중요한가요?")
                        .systemFont(.footnote, weight: .bold)
                        .foregroundStyle(Color.HPPrimary.base)
                    HStack(spacing: 0) {
                        Text("적절한 말 빠르기는 ")
                        + Text("전달력 있는 발표").bold()
                        + Text("를 위한 필수 요소에요.\n")
                        + Text("너무 빠른 발화는 청중의 이해를 어렵게 하고, 너무 느린 발화는 흥미를 잃게 해요.\n")
                        + Text("\'세상을 바꾸는 시간\'에 출연한 연사들의 평균 말 빠르기는 ")
                        + Text("330~370EPM").bold()
                        + Text(" 범위 안에 있어요.")
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .systemFont(.caption)
                    .foregroundStyle(Color.HPTextStyle.darker)
                    Text("* 개인의 발표 스타일에 따라 330~370EPM 에서 벗어날 수 있어요.")
                        .fixedSize(horizontal: false, vertical: true)
                        .systemFont(.caption2, weight: .medium)
                        .foregroundStyle(Color.HPPrimary.base)
                }
                VStack(alignment: .leading, spacing: .HPSpacing.xxxsmall) {
                    Text("말 빠르기 지표를 어떻게 활용하면 좋을까요?")
                        .systemFont(.footnote, weight: .bold)
                        .foregroundStyle(Color.HPPrimary.base)
                    Text("1. 스크립트와 함께 연습한 음성을 자주 들어보세요. 말 빠르기에 따라 내 발표가 어떻게 들리는지 판단할 수 있어요.")
                        .fixedSize(horizontal: false, vertical: true)
                        .systemFont(.caption)
                        .foregroundStyle(Color.HPTextStyle.darker)
                    Text("2. 차트에 표시 된 \'속도가 빠른/느린 구간\' 영역에서, 해당 부분의 음성을 들으며 그 부분을 본인이 의도해서 말한 것이 맞는지 확인해 보세요.")
                        .fixedSize(horizontal: false, vertical: true)
                        .systemFont(.caption)
                        .foregroundStyle(Color.HPTextStyle.darker)
                }
            }
            .padding(.vertical, .HPSpacing.xsmall)
            .padding(.horizontal, .HPSpacing.small)
            .frame(maxWidth: 520, maxHeight: 500)
        }
    }
}

#Preview {
    @State var isSpeedTooltipActive = false
    return EPMSheet(isSpeedTooltipActive: $isSpeedTooltipActive)
}
