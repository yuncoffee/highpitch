//
//  FillerWordAudioIndicator.swift
//  highpitch
//
//  Created by yuncoffee on 11/9/23.
//

import SwiftUI
#if PREVIEW
import SwiftData
#endif

struct FillerWordAudioIndicator: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
    @State
    private var duration: Double = 0
    
#if PREVIEW
    // MARK: - MockData
    @Query(sort: \PracticeModel.creatAt)
    var practices: [PracticeModel]
#endif
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geometry in
                let widthPercent = geometry.size.width * 0.01
                ForEach(viewStore.getSortedSentences()) { sentence in
                    let fillerWordCount = viewStore.getContainsFillerCount(sentenceIndex: sentence.index)
                    let xRatio = Double(sentence.startAt * 100) / duration
                    if fillerWordCount > 0 {
                        VStack {
    //                        Text("\(fillerWordCount)")
                            Rectangle()
                                .rotation(Angle(degrees: 45.0))
                                .frame(width: 8, height: 8)
                                .foregroundStyle(
                                    fillerWordCount > 2
                                    ? Color.HPSecondary.base
                                    : Color.HPPrimary.dark.opacity(0.5)
                                )
                        }
                        .offset(x: widthPercent * xRatio)
                        .frame(maxHeight: .infinity)
                        .onTapGesture {
                            viewStore.playMediaFromSentence(atTime: Double(sentence.startAt), index: sentence.index)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, .HPSpacing.xxxsmall)
        .frame(maxWidth:.infinity, maxHeight: viewStore.AUDIO_INDICATOR_HEIGHT, alignment: .leading)
        .background(Color.HPPrimary.lightnest.opacity(0.55))
        .onAppear {
            // MARK: - Add MockData
#if PREVIEW
            if let sample = practices.first {
                viewStore.practice = sample
            }
            let url = Bundle.main.url(forResource: "20231107202138", withExtension: "m4a")
            if let url = url {
                viewStore.practice.audioPath = url
                do {
                    try viewStore.mediaManager.registerAudio(url: url)
                } catch {
                    print(error)
                }
            }
#endif
            duration = viewStore.mediaManager.getDuration() * 1000
        }
    }
}

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    
    return VStack {
        FillerWordAudioIndicator()
            .modelContainer(modelContainer)
            .environment(PracticeViewStore(
                projectName: "",
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
    .border(.blue)
    .frame(maxWidth: 800)
    .padding(32)
}
