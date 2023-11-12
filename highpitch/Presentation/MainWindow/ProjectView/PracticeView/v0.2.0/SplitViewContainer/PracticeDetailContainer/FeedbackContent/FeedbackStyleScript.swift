//
//  FeedbackStyleScript.swift
//  highpitch
//
//  Created by yuncoffee on 11/12/23.
//

import SwiftUI
#if PREVIEW
import SwiftData
#endif

struct FeedbackStyleScript: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
#if PREVIEW
    // MARK: - MockData
    @Query(sort: \PracticeModel.creatAt)
    var practices: [PracticeModel]
#endif
    
    var body: some View {
        ScrollViewReader { scrollViewProxy in
            scriptContainer
                .onChange(of: viewStore.nowSentence) { _, newValue in
                    withAnimation {
                        scrollViewProxy.scrollTo(newValue, anchor: .center)
                    }
                }
                .onChange(of: viewStore.currentFeedbackViewType) { _, _ in
                    withAnimation {
                        scrollViewProxy.scrollTo(viewStore.nowSentence, anchor: .center)
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

extension FeedbackStyleScript {
    private func intToMMSS(input: Int) -> String {
        let minute = input / 1000 / 60
        let second = input / 1000 % 60
        
        var displayMinute = minute.description
        var displaySecond = second.description
        
        if minute < 10 {
            displayMinute = "0\(displayMinute)"
        }
        if second < 10 {
            displaySecond = "0\(displaySecond)"
        }
        
        return "\(displayMinute):\(displaySecond)"
    }
}

extension FeedbackStyleScript {
    @ViewBuilder
    private var scriptContainer: some View {
        VStack(spacing: .zero) {
            let sentences = viewStore.getSortedSentences()
            ForEach(sentences) { sentence in
                scriptCell(sentence: sentence)
            }
        }
        .padding(.horizontal, .HPSpacing.small)
        .padding(.bottom, .HPSpacing.xxxlarge + .HPSpacing.xxxsmall)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func scriptCell(sentence: SentenceModel) -> some View {
        let isSelected = viewStore.nowSentence == sentence.index
        
        return VStack {
            switch viewStore.currentFeedbackViewType {
            case .every:
                HStack(alignment: .top, spacing: .HPSpacing.xxsmall) {
                    let words = viewStore.getContainsWords(sentenceIndex: sentence.index)
                    if let startAt = words.first?.index, let endAt = words.last?.index {
                        EveryScriptCell(
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
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.vertical, .HPSpacing.xxxsmall)
                .padding(.horizontal, .HPSpacing.xxsmall)
                .clipShape(RoundedRectangle(cornerRadius: .HPCornerRadius.medium))
            case .fillerWord:
                HStack(alignment: .top, spacing: .HPSpacing.xxsmall) {
                    HPLabel(
                        content: (intToMMSS(input: sentence.startAt), nil),
                        type: .blockFill(.HPCornerRadius.small),
                        size: .small,
                        color: isSelected ? .HPPrimary.lightness : .clear,
                        contentColor: isSelected ? .HPPrimary.dark : .HPPrimary.light,
                        fontStyle: .systemDetail(.footnote, .semibold),
                        padding: (.zero, .HPSpacing.xxxsmall)
                    )
                    .fixedSize()
                    let words = viewStore.getContainsWords(sentenceIndex: sentence.index)
                    if let startAt = words.first?.index, let endAt = words.last?.index {
                        FillerWordScriptCell(
                            words: words,
                            startAt: startAt,
                            endAt: endAt,
                            containerWidth: viewStore.SCRIPT_CONTAINER_WIDTH,
                            nowSentece: viewStore.nowSentence,
                            sentenceIndex: sentence.index) { sentenceIndex in
                                viewStore.nowSentence = sentenceIndex
                            }
                            .id(sentence.index)
                            .padding(.bottom, .HPSpacing.xxxxsmall)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.vertical, .HPSpacing.xxxsmall)
                .padding(.horizontal, .HPSpacing.xxsmall)
                .background(isSelected ? Color.HPComponent.Section.point : .clear)
                .clipShape(RoundedRectangle(cornerRadius: .HPCornerRadius.medium))
            case .speed:
                HStack(alignment: .top, spacing: .HPSpacing.xxsmall) {
                    HPLabel(
                        content: (intToMMSS(input: sentence.startAt), nil),
                        type: .blockFill(.HPCornerRadius.small),
                        size: .small,
                        color: isSelected ? .HPPrimary.lightness : .clear,
                        contentColor: isSelected ? .HPPrimary.dark : .HPPrimary.light,
                        fontStyle: .systemDetail(.footnote, .semibold),
                        padding: (.zero, .HPSpacing.xxxsmall)
                    )
                    .fixedSize()
                    let words = viewStore.getContainsWords(sentenceIndex: sentence.index)
                    if let startAt = words.first?.index, let endAt = words.last?.index {
                        FillerWordScriptCell(
                            words: words,
                            startAt: startAt,
                            endAt: endAt,
                            containerWidth: viewStore.SCRIPT_CONTAINER_WIDTH,
                            nowSentece: viewStore.nowSentence,
                            sentenceIndex: sentence.index) { sentenceIndex in
                                viewStore.nowSentence = sentenceIndex
                            }
                            .id(sentence.index)
                            .padding(.bottom, .HPSpacing.xxxxsmall)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.vertical, .HPSpacing.xxxsmall)
                .padding(.horizontal, .HPSpacing.xxsmall)
                .background(isSelected ? Color.HPComponent.Section.point : .clear)
                .clipShape(RoundedRectangle(cornerRadius: .HPCornerRadius.medium))
            }
        }
    }
}

extension FeedbackStyleScript {
    struct FillerWordScriptCell: View {
        var words: [WordModel]
        var startAt: Int
        var endAt: Int
        var containerWidth: CGFloat
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
            .contentShape(Rectangle())
            .onTapGesture {
                completion(sentenceIndex)
            }
        }
    }
    
    struct EveryScriptCell: View {
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
            .contentShape(Rectangle())
            .onTapGesture {
                completion(sentenceIndex)
            }
        }
    }
}

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    return VStack {
        FeedbackStyleScript()
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
