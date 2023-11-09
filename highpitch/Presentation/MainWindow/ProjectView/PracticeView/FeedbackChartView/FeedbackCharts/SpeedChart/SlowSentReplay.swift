//
//  SlowSentReplay.swift
//  highpitch
//
//  Created by 이용준의 Macbook on 11/3/23.
//

import SwiftUI

struct SlowSentReplay: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    @State
    var isDetailActive = false
    @State
    var selectedIndex = -1
    @State
    var selectedSentenceInfo: SentenceInfo?
    
    var body: some View {
        VStack(spacing: 0) {
            header
            if isDetailActive {
                detailView
            }
        }
        .frame(
            minWidth: 388,
            maxWidth: 388,
            minHeight: 70,
            maxHeight: 332,
            alignment: .top
        )
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 2)
                .foregroundStyle(Color.HPComponent.stroke)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.bottom, .HPSpacing.xxxlarge + .HPSpacing.xxxsmall)
        .padding(.trailing, .HPSpacing.xxxlarge)
        .onChange(of: viewStore.mediaManager.currentTime) { _, newValue in
            updateSelectedIndex(timer: newValue)
        }
    }
}

extension SlowSentReplay {
    private func updateSelectedIndex(timer: TimeInterval) {
        if viewStore.mediaManager.stopPoint != nil {
            if timer > (viewStore.mediaManager.stopPoint!)/1000 {
                viewStore.mediaManager.stopPoint = nil
                selectedIndex = -1
                viewStore.mediaManager.pausePlaying()
            }
        }
    }
    
    private func play(at: Int, sentenceInfo: SentenceInfo) {
        viewStore.mediaManager.playAt(atTime: sentenceInfo.startAt)
        viewStore.mediaManager.play()
        viewStore.mediaManager.stopPoint = sentenceInfo.endAt
        viewStore.nowSentence = at
        
        selectedIndex = sentenceInfo.index
        selectedSentenceInfo = sentenceInfo
    }
    
    private func stop() {
        viewStore.mediaManager.pausePlaying()
        selectedSentenceInfo = nil
    }
}

extension SlowSentReplay {
    @ViewBuilder
    var header: some View {
        HStack {
            Text("느리게 말한 구간 듣기")
                .systemFont(.subTitle)
                .foregroundStyle(Color.HPTextStyle.darker)
            Spacer()
            Label("열기", systemImage: "chevron.right")
                .labelStyle(.iconOnly)
                .systemFont(.body)
                .foregroundStyle(Color.HPTextStyle.base)
                .rotationEffect(isDetailActive ? .degrees(90) : .zero)
        }
        .padding(.top, .HPSpacing.xsmall + .HPSpacing.xxxxsmall)
        .padding(.bottom, isDetailActive ? .HPSpacing.xsmall + .HPSpacing.xxxxsmall : 0)
        .padding(.horizontal, .HPSpacing.xsmall + .HPSpacing.xxxxsmall)
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
            VStack(spacing: 0) {
                ForEach(Array(viewStore.getSortedSentences().enumerated()), id: \.1.id) { index, each in
                    if viewStore.practice.summary.slowSentenceIndex.contains(each.index) {
                        SentenceCell(
                            index: index,
                            sentence: each.sentence,
                            isLast: index == viewStore.practice.sentences.count - 1,
                            isPlay: selectedIndex == index,
                            selectedIndex: $selectedIndex) {
                                let _selectedSentenceInfo = SentenceInfo(index: index,
                                                                         startAt: Double(each.endAt),
                                                                         endAt: Double(each.startAt)
                                )
                                play(at: each.index, sentenceInfo: _selectedSentenceInfo)
                            } stopCompletion: {
                                stop()
                            }
                    }
                }
            }
        }
    }
}
