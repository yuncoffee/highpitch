//
//  FastSentReplay.swift
//  highpitch
//
//  Created by 이용준의 Macbook on 10/17/23.
//

import SwiftUI

struct FastSentReplay: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
    @Environment(MediaManager.self)
    private var mediaManager
    var practice: PracticeModel
    @State
    var isDetailActive = false
    @State
    var selectedIndex = -1
    @State
    var selectedSentenceInfo: (index: Int, startAt: Double, endAt: Double)?
    
    @Environment(PracticeManager.self)
    private var practiceManager
        
    var body: some View {
        VStack(spacing: 0) {
            header
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        isDetailActive.toggle()
                    }
                }
            if isDetailActive {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(
                            Array(practice.sentences.sorted(by: {$0.index < $1.index }).enumerated()),
                            id: \.1.id
                        ) { index, each in
                            if practice.summary.fastSentenceIndex.contains(each.index) {
                                SentenceCell(
                                    index: index,
                                    sentence: each.sentence,
                                    isLast: index == viewStore.practice.sentences.count - 1,
                                    isPlay: selectedIndex == index,
                                    selectedIndex: $selectedIndex
                                ) {
                                    let _startAt = Double(each.startAt)
                                    let _endAt = Double(each.endAt)
                                    viewStore.mediaManager.playAt(atTime: _startAt)
                                    viewStore.mediaManager.play()
                                    viewStore.mediaManager.stopPoint = _endAt
                                    viewStore.nowSentence = each.index
                                    selectedIndex = index
                                    selectedSentenceInfo = (index, _startAt, _endAt)
                                } stopCompletion: {
                                    viewStore.mediaManager.pausePlaying()
                                }
                            }
                        }
                    }
                }
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
        .padding(.bottom, .HPSpacing.xsmall)
        .padding(.trailing, .HPSpacing.xxxlarge)
        .onChange(of: viewStore.mediaManager.currentTime) { _, newValue in
            if viewStore.mediaManager.stopPoint != nil {
                if newValue > (viewStore.mediaManager.stopPoint!)/1000 {
                    viewStore.mediaManager.stopPoint = nil
                    selectedIndex = -1
                    viewStore.mediaManager.pausePlaying()
                }
            }
        }
        .onChange(of: viewStore.mediaManager.currentTime) { _, newValue in
            if let selectedSentenceInfo = selectedSentenceInfo {
                if selectedSentenceInfo.startAt.isLessThanOrEqualTo(newValue*1000), !selectedSentenceInfo.endAt.isLess(than: newValue*1000) {
                    selectedIndex = selectedSentenceInfo.index
                }
            }
        }.onChange(of: viewStore.mediaManager.isPlaying) { _, _ in
            if !viewStore.mediaManager.isPlaying {
                selectedIndex = -1
            }
        }
    }
}

extension FastSentReplay {
    private func play(startAt: Double, endAt: Double) {
        mediaManager.playAt(atTime: startAt)
        mediaManager.play()
        mediaManager.stopPoint = endAt
    }
}

extension FastSentReplay {
    @ViewBuilder
    var header: some View {
        HStack {
            Text("빠르게 말한 구간 듣기")
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
    }
}
