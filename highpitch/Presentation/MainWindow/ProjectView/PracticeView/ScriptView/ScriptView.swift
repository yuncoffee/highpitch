//
//  ScriptView.swift
//  highpitch
//
//  Created by yuncoffee on 10/14/23.
//

import SwiftUI

@Observable
final class ScriptVM {
    var offsetX = 0.0
}

struct ScriptView: View {
    @Environment(PracticeViewStore.self)
    private var viewStore
    var sentences: [SentenceModel]
    var words: [WordModel]
    var practice: PracticeModel
    @State
    private var wordSizes: [CGSize] = []
    @State
    private var range: [(start: Int, end: Int)] = []
    @State
    private var startIndex = 0
    
    private let SCRIPT_CONTAINER_WIDTH: CGFloat = 279
    
    var scriptVM = ScriptVM()
    
    var body: some View {
        VStack(alignment: .leading, spacing: .HPSpacing.small) {
            HStack(alignment:.top, spacing: .HPSpacing.xxxxsmall) {
                Text("내 연습 다시보기")
                    .systemFont(.title)
                    .foregroundStyle(Color.HPTextStyle.darker)
                HPTooltip(
                    tooltipContent: "다시보기",
                    arrowEdge: .bottom,
                    content: { PracticeInfoPopover() }
                )
            }
            .frame(maxHeight: 64)
            .padding(.horizontal, .HPSpacing.small)
            ScrollView {
                ScrollViewReader { scrollViewProxy in
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(Array(sentences.enumerated()), id: \.1.id) { index, sentence in
                            if !range.isEmpty {
                                ScriptCell(
                                    words: words[range[index].start...range[index].end],
                                    startAt: range[index].start,
                                    endAt: range[index].end,
                                    containerWidth: SCRIPT_CONTAINER_WIDTH,
                                    isFastSentence: 
                                        practice.summary.fastSentenceIndex.contains(sentence.index),
                                    isSlowSentence:
                                        practice.summary.slowSentenceIndex.contains(sentence.index),
                                    nowSentece: viewStore.nowSentence,
                                    sentenceIndex: index
                                ) { sentenceIndex in
                                    viewStore.mediaManager.pausePlaying()
                                    viewStore.mediaManager.playAt(atTime: Double(sentences[sentenceIndex].startAt))
                                    viewStore.nowSentence = sentenceIndex
                                    viewStore.mediaManager.play()
                                }
                                .id(sentence.index)
                            }
                        }
                    }
                    .frame(
                        minWidth: SCRIPT_CONTAINER_WIDTH,
                        maxWidth: SCRIPT_CONTAINER_WIDTH,
                        maxHeight:.infinity, alignment: .topLeading
                    )
                    .padding(.bottom, .HPSpacing.xxxlarge + .HPSpacing.xxxsmall)
                    .padding(.horizontal, .HPSpacing.medium)
                    .onChange(of: viewStore.nowSentence) { _, newValue in
                        withAnimation {
                            scrollViewProxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                }
            }
            .padding(.bottom, 100)
        }
        .border(Color.HPComponent.stroke, width: 1, edges: [.leading])
        .onAppear {
            viewStore.nowSentence = 0
            sentences.forEach { sentence in
                var result = (start: 0, end: 0)
                result.start = startIndex
                let lastWord = sentence.sentence.components(separatedBy: " ").reversed().first
                
                if let lastWord = lastWord,
                    let lastIndex = words[startIndex...].firstIndex(where: {$0.word == lastWord}) {
                    result.end = lastIndex
                    if lastIndex < words.count - 1 {
                        startIndex = lastIndex + 1
                    }
                }
                range.append(result)
            }
            
        }
        .onChange(of: viewStore.mediaManager.currentTime, { _, newValue in
            if viewStore.nowSentence < sentences.count {
                if newValue > Double(sentences[viewStore.nowSentence].endAt)/1000 {
                    viewStore.nowSentence += 1
                }
            }
        })
    }
}

extension ScriptView {
    private func play(startAt: Double, index: Int) {
        viewStore.mediaManager.pausePlaying()
    }
}
