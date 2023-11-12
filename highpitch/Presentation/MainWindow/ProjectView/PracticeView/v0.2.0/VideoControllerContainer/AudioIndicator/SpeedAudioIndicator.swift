//
//  SpeedAudioIndicator.swift
//  highpitch
//
//  Created by yuncoffee on 11/9/23.
//

import SwiftUI
import Charts
#if PREVIEW
import SwiftData
#endif

struct SpeedAudioIndicator: View {
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
        VStack {
            let sentences = viewStore.getSortedSentences()
            let epmRange = viewStore.getEpmRange()
            let linearGradient = LinearGradient(
                gradient: Gradient(
                    colors: [.HPOrange.base, .HPOrange.base.opacity(0)]),
                startPoint: .top,
                endPoint: .bottom
            )
            Chart {
                ForEach(sentences) { sentence in
                    LineMark(
                        x: .value("sentenceIndex", sentence.index),
                        y: .value("EPM", sentence.epmValue)
                    )
                    .foregroundStyle(Color.HPOrange.base)
                    .lineStyle(StrokeStyle(lineWidth: 2))
                }
                ForEach(sentences) { sentence in
                    AreaMark(
                        x: .value("sentenceIndex", sentence.index),
                        y: .value("EPM", sentence.epmValue)
                    )
                }
                .foregroundStyle(linearGradient)
            }
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .chartXScale(domain: .automatic)
            .chartYScale(
                domain: [
                    epmRange.first - 10.0,
                    epmRange.last + 10.0
                ]
            )
        }
        .padding(.horizontal, .HPSpacing.xxxsmall)
        .frame(maxWidth:.infinity, maxHeight: 32, alignment: .leading)
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
        SpeedAudioIndicator()
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
    .border(.blue)
    .frame(maxWidth: 800)
    .padding(32)
}
