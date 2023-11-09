//
//  SentenceCell.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI

struct SentenceCell: View {
    var index: Int
    var sentence: String
    var isLast = false
    @State
    var isPlay = false
    
    @Binding
    var selectedIndex: Int
        
    var playCompletion: () -> Void
    var stopCompletion: () -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: .HPSpacing.xsmall) {
            Button {
                isPlay
                ? puase()
                : playCompletion()
            } label: {
                Label("play", systemImage: isPlay ? "pause.fill" : "play.fill")
                    .labelStyle(.iconOnly)
                    .systemFont(.body)
                    .foregroundStyle(Color.HPPrimary.base)
            }
            .buttonStyle(.plain)
            .frame(width: 32, height: 32)
            .background(
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundStyle(Color.HPPrimary.lightness)
                    .background(Color.HPPrimary.lightnest)
            )
            .clipShape(Circle())
            Text("\(sentence)")
                .systemFont(.body)
                .foregroundStyle(Color.HPTextStyle.darker)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .padding(.vertical, .HPSpacing.xsmall + .HPSpacing.xxxxsmall)
        .border(.HPComponent.stroke, width: isLast ? 0 : 1, edges: [.bottom])
        .padding(.horizontal, .HPSpacing.xsmall + .HPSpacing.xxxxsmall)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(isPlay ? Color.HPComponent.Section.point : .clear)
        .padding(.horizontal, 2)
        .onChange(of: selectedIndex) { _, newValue in
            isPlay = newValue == index
        }
    }
}

extension SentenceCell {
    private func play() {
        playCompletion()
    }
    
    private func puase() {
        stopCompletion()
        isPlay = false
    }
}

// #Preview {
//    SentenceCell()
// }
