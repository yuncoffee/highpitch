//
//  EveryFeedbackContent.swift
//  highpitch
//
//  Created by yuncoffee on 11/9/23.
//

import SwiftUI
#if PREVIEW
import SwiftData
#endif

struct EveryFeedbackContent: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
#if PREVIEW
    // MARK: - MockData
    @Query(sort: \PracticeModel.creatAt)
    var practices: [PracticeModel]
#endif
    
    var body: some View {
        ScrollView {
            ScrollViewReader { scrollViewProxy in
                VStack(alignment:. leading, spacing: .zero) {
                    let sentences = viewStore.getSortedSentences()
                    ForEach(sentences) { sentence in
                        let words = viewStore.getContainsWords(sentenceIndex: sentence.index)
                        if let startAt = words.first?.index, let endAt = words.last?.index {
                            ScriptCell(
                                words: words,
                                startAt: startAt,
                                endAt: endAt,
                                containerWidth: viewStore.SCRIPT_CONTAINER_WIDTH,
                                isFastSentence: viewStore.isFastSentence(sentenceIndex: sentence.index),
                                isSlowSentence: viewStore.isSlowSentence(sentenceIndex: sentence.index),
                                nowSentece: viewStore.nowSentence,
                                sentenceIndex: sentence.index) { sentenceIndex in
                                    print(sentenceIndex)
                                    viewStore.nowSentence = sentenceIndex
                                }
                                .id(sentence.index)
                                .padding(.bottom, .HPSpacing.xxxxsmall)
                        }
                    }
                }
                .frame(
                    minWidth: viewStore.SCRIPT_CONTAINER_WIDTH,
                    maxWidth: viewStore.SCRIPT_CONTAINER_WIDTH,
                    maxHeight:.infinity,
                    alignment: .topLeading
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
        .onAppear {
            // MARK: - Add MockData
#if PREVIEW
            if let sample = practices.first {
                viewStore.practice = sample
            }
#endif
        }
        
    }
}

extension EveryFeedbackContent {
    struct ScriptCell: View {
        var words: [WordModel]
        var startAt: Int
        var endAt: Int
        var containerWidth: CGFloat
        var isFastSentence: Bool
        var isSlowSentence: Bool
        var nowSentece: Int
        var sentenceIndex: Int
        var completion: (_ sentenceIndex: Int) -> Void
        
        var body: some View {
            var offsetX = 0.0
            var offsetY = 0.0
            
            ZStack(alignment: .topLeading) {
                ForEach(words, id: \.id) { word in
                    Text("\(word.word)")
                        .alignmentGuide(.leading) { item in
                            /// lineHeight
                            if abs(offsetX - item.width) > containerWidth {
                                offsetX = 0
                                offsetY -= item.height + 8
                            }
                            let result = offsetX
                            if endAt == word.index {
                                offsetX = 0
                            } else {
                                offsetX -= item.width
                            }
                            return result
                        }
                        .alignmentGuide(.top) { _ in
                            let result = offsetY
                            if endAt == word.index {
                                offsetY = 0
                            }
                            return result
                        }
                        .systemFont(
                            word.isFillerWord || nowSentece == word.sentenceIndex
                            ? .subTitle
                            : .body
                        )
                        .foregroundStyle(
                            word.isFillerWord
                            ? Color.HPPrimary.base
                            : nowSentece == word.sentenceIndex
                            ? Color.HPTextStyle.darker
                            : Color.HPTextStyle.base
                        )
                        .background(
                            Rectangle()
                                .frame(height: 8, alignment: .bottom)
                                .offset(
                                    y: nowSentece == word.sentenceIndex
                                    ? 4
                                    : word.isFillerWord
                                    ? 6.5
                                    : 4
                                )
                                .foregroundStyle(
                                    isFastSentence || isSlowSentence
                                    ? Color.HPComponent.highlight
                                    : Color.clear
                                )
                        )
                        .offset(
                            y: nowSentece == word.sentenceIndex
                            ? 0
                            : word.isFillerWord
                            ? -4
                            : 0
                        )
                }
            }
            .frame(
                minWidth: containerWidth,
                maxWidth: containerWidth,
                alignment: .topLeading
            )
            .onTapGesture {
                completion(sentenceIndex)
            }
        }
    }
}

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    return VStack {
        EveryFeedbackContent()
            .modelContainer(modelContainer)
            .environment(PracticeViewStore(
                practice: PracticeModel(
                    practiceName: "",
                    index: 0,
                    isVisited: false,
                    creatAt: "",
                    utterances: [],
                    summary: PracticeSummaryModel()
                ),
                mediaManager: MediaManager()))
    }
    .frame(minWidth: 440, maxWidth: 440,  minHeight: 600)
    .padding(24)
}
