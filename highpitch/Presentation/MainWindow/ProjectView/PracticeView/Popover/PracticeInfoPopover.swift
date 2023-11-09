//
//  PracticeInfoPopover.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI

struct PracticeInfoPopover: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("내 연습 다시보기란?")
                .systemFont(.footnote, weight: .bold)
                .foregroundStyle(Color.HPTextStyle.darker)
                .padding(.bottom, .HPSpacing.xxxxsmall)
            Text("연습했던 해당 회차의 녹음본을 토대로 추출된 스크립트에요.")
                .systemFont(.caption)
                .foregroundStyle(Color.HPTextStyle.darker)
            Text("스크립트 내에 보라색 표시 글씨는 내가 사용한 습관어를, 형광펜 밑줄은 빠르게 혹은 느리게 말한 구간을 나타내요.")
                .fixedSize(horizontal: false, vertical: true)
                .systemFont(.caption, weight: .semibold)
                .foregroundStyle(Color.HPTextStyle.darker)
                .padding(.bottom, .HPSpacing.xxxxsmall)
            Text("* 스크립트에서도 듣고싶은 구간을 클릭하면 해당 부분부터 재생돼요.")
                .systemFont(.caption2, weight: .medium)
                .foregroundStyle(Color.HPPrimary.base)
        }
        .padding(.vertical, .HPSpacing.xsmall)
        .padding(.horizontal, .HPSpacing.small)
        .frame(maxWidth: 400, maxHeight: 145)
    }
}

#Preview {
    PracticeInfoPopover()
}
