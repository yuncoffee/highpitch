//
//  FillerWordFeedbackContent.swift
//  highpitch
//
//  Created by yuncoffee on 11/9/23.
//

import SwiftUI
#if PREVIEW
import SwiftData
#endif

struct FillerWordFeedbackContent: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
#if PREVIEW
    // MARK: - MockData
    @Query(sort: \PracticeModel.creatAt)
    var practices: [PracticeModel]
#endif
    
    var body: some View {
        ScrollView {
            VStack(spacing: .HPSpacing.xsmall) {
                chartContainer
                scriptContainer
            }
            .padding(.bottom, .HPSpacing.small)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
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

extension FillerWordFeedbackContent {
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

extension FillerWordFeedbackContent {
    @ViewBuilder
    private var chartContainer: some View {
        HPArcodianView(label: "사용된 습관어 종류 및 횟수") {
            Text("Hello")
        }
        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .padding(.horizontal, .HPSpacing.small)
    }
    
    @ViewBuilder
    private var scriptContainer: some View {
        VStack(spacing: .zero) {
            let sentences = viewStore.getSortedSentences()
            ForEach(sentences) { sentence in
                scriptCell(sentence: sentence)
            }
        }
        .padding(.horizontal, .HPSpacing.small)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func scriptCell(sentence: SentenceModel) -> some View {
        let isSelected = viewStore.nowSentence == sentence.index
        
        return HStack(alignment: .top, spacing: .HPSpacing.xxsmall) {
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
                ScriptCell(
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

extension FillerWordFeedbackContent {
    
    
    struct ScriptCell: View {
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
            .onTapGesture {
                completion(sentenceIndex)
            }
        }
    }
}

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    return VStack {
        FillerWordFeedbackContent()
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
