//
//  FillerWordSheet.swift
//  highpitch
//
//  Created by yuncoffee on 11/7/23.
//

import SwiftUI

struct FillerWordSheet: View {
    @Binding
    var isFillerWordTooltipActive: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                isFillerWordTooltipActive = false
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
                    Text("습관어란?")
                        .systemFont(.footnote, weight: .bold)
                        .foregroundStyle(Color.HPPrimary.base)
                    HStack(spacing: 0) {
                        Text("습관어란, 발표 또는 스피치와 같은 ")
                        + Text("말을 할 때 무의식 중에 습관적으로 사용하게 되는 군말").bold()
                        + Text("을 뜻해요. (예를 들어 ‘아, 음, 그러니까, 약간, 좀’ 등이 있어요.)")
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .systemFont(.caption)
                    .foregroundStyle(Color.HPTextStyle.darker)
                }
                VStack(alignment: .leading, spacing: .HPSpacing.xxxsmall) {
                    Text("습관어 사용을 왜 개선해야해요?")
                        .systemFont(.caption, weight: .bold)
                        .foregroundStyle(Color.HPPrimary.base)
                    HStack(spacing: 0) {
                        Text("습관어를 적절히 사용하면 괜찮지만, ")
                        + Text("습관어 사용이 너무 잦다면 청자가 듣기에 내가 말하고자 하는 이야기의 흐름이 끊기고 집중력을 흐리게 만들 수 있어요. ").bold()
                        + Text("가장 큰 문제는 ")
                        + Text("프로페셔널한 느낌을 줄 수 없어").bold()
                        + Text(" 나의 이미지를 훼손시킬 우려가 있다는 것이에요.")
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .systemFont(.caption)
                    .foregroundStyle(Color.HPTextStyle.darker)
                }
                VStack(alignment: .leading, spacing: .HPSpacing.xxxsmall) {
                    Text("습관어 사용을 어떻게 개선할 수 있나요?")
                        .systemFont(.caption, weight: .bold)
                        .foregroundStyle(Color.HPPrimary.base)
                    HStack {
                        Text("1. 반복적인 모니터링을 통해 내가 자주 사용하는 습관어를 확인")
                        + Text("내가 자주 사용하는 습관어를 확인").bold()
                        + Text("하고, ")
                        + Text("어떤 상황(당황할 때, 생각할 때 등)에서 주로 사용하게 되는지 파악").bold()
                        + Text("해보아요.")
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .systemFont(.caption)
                    .foregroundStyle(Color.HPTextStyle.darker)
                    HStack {
                        Text("2. 습관어를 사용하기보다 ")
                        + Text("한 템포 쉬고 말을 해도 좋아요. ").bold()
                        + Text("커뮤니케이션 전문가인 앤드류 들루겐(Andrew Dlugan)에 따르면 오히려 ")
                        + Text("‘마법의 짧은 침묵 Pause’").bold()
                        + Text("을 통해 상대가 나의 이야기를 더 잘 이해할 수 있고, 기대를 불러 일으킬 수 있으며, 강한 인상과 여운을 남길 수 있는 효과를 줄 수 있다고 해요. 어색한 습관어보다는 ")
                        + Text("1~2초 가량의 자연스러운 침묵을 활용").bold()
                        + Text("하면 더욱 더 프로페셔널하게 비춰질 거에요.")
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .systemFont(.caption)
                    .foregroundStyle(Color.HPTextStyle.darker)
                }
            }
            .padding(.vertical, .HPSpacing.xsmall)
            .padding(.horizontal, .HPSpacing.small)
            .frame(maxWidth: 520, maxHeight: 480)
        }
    }
}

#Preview {
    @State var isFillerWordTooltipActive = false
    
    return FillerWordSheet(isFillerWordTooltipActive: $isFillerWordTooltipActive)
}
