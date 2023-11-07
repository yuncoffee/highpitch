//
//  FillerWordDetail.swift
//  highpitch
//
//  Created by 이용준의 Macbook on 10/17/23.
//

import SwiftUI

struct FillerWordDetail: View {
    @State
    var fillerWords: [FillerWordModel]

    @State
    private var isDetailActive = false
    
    var body: some View {
        VStack(spacing: 0) {
            header
            if isDetailActive {
                detailView
            }
        }
        .padding(.HPSpacing.xsmall + .HPSpacing.xxxxsmall)
        .frame(
            minWidth: 388,
            maxWidth: 388,
            minHeight: 70,
            maxHeight: 374,
            alignment: .top
        )
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 2)
                .foregroundStyle(Color.HPComponent.stroke)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.trailing, .HPSpacing.xxxlarge)
    }
}

extension FillerWordDetail {
    @ViewBuilder
    var header: some View {
        HStack {
            Text("언급된 습관어 상세보기")
                .systemFont(.subTitle)
                .foregroundStyle(Color.HPTextStyle.darker)
            Spacer()
            Label("열기", systemImage: "chevron.right")
                .labelStyle(.iconOnly)
                .systemFont(.body)
                .foregroundStyle(Color.HPTextStyle.base)
                .rotationEffect(isDetailActive ? .degrees(90) : .zero)
        }
        .padding(.bottom, isDetailActive ? .HPSpacing.xsmall + .HPSpacing.xxxxsmall : 0)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                isDetailActive.toggle()
            }
        }
    }
    
    @ViewBuilder
    var detailView: some View {
        ScrollView {
            ForEach(Array(fillerWords.enumerated()), id: \.element.id) { index, each in
                if each.count > 0 {
                    var isOdd = index % 2 != 0
                    var count = each.count
                    var word = each.fillerWord
                    FillerWordDetailCell(isOdd: isOdd, count: count, word: word)
                }
            }
        }
    }
}
