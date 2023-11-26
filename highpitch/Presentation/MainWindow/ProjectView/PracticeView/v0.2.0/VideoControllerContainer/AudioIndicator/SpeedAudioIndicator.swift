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
    private var duration: Double = 1
    
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
                    let isSlowSentence = viewStore.isSlowSentence(sentenceIndex: sentence.index)
                    let isFastSentence = viewStore.isFastSentence(sentenceIndex: sentence.index)
                    let xRatio = Double(sentence.startAt * 100) / duration
                    let width = Double(sentence.endAt * 100) / duration - Double(sentence.startAt * 100) / duration
                    if viewStore.scriptViewSpeedType == .fast {
                        if isFastSentence {
                            VStack {
                                let _width = widthPercent * width
                                Rectangle()
                                    .frame(
                                        width: _width,
                                        height: viewStore.AUDIO_INDICATOR_HEIGHT
                                    )
                                    .foregroundStyle(Color("FF9500").opacity(0.3))
                            }
                            .offset(x: widthPercent * xRatio)
                            .frame(maxHeight: .infinity)
                            .onTapGesture {
                                viewStore.playMediaFromSentence(atTime: Double(sentence.startAt), index: sentence.index)
                            }
                        }
                    } else if viewStore.scriptViewSpeedType == .slow {
                        if isSlowSentence {
                            VStack {
                                let _width = widthPercent * width
                                Rectangle()
                                    .frame(
                                        width: _width,
                                        height: viewStore.AUDIO_INDICATOR_HEIGHT
                                    )
                                    .foregroundStyle(Color("FF9500").opacity(0.3))
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
            
        }
        .padding(.horizontal, .HPSpacing.xxxsmall)
        .frame(maxWidth:.infinity, maxHeight: viewStore.AUDIO_INDICATOR_HEIGHT, alignment: .leading)
        .background(Color("FFF8F3").opacity(0.7))
        .background(.thinMaterial)
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

extension SpeedAudioIndicator {
    @ViewBuilder
    var chartView: some View {
        let sentences = viewStore.getSortedSentences()
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
                    y: .value("EPM", sentence.spmValue)
                )
                .foregroundStyle(Color.HPOrange.base)
                .lineStyle(StrokeStyle(lineWidth: 2))
            }
            ForEach(sentences) { sentence in
                AreaMark(
                    x: .value("sentenceIndex", sentence.index),
                    y: .value("EPM", sentence.spmValue)
                )
            }
            .foregroundStyle(linearGradient)
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartXScale(domain: .automatic)
        .chartYScale(domain: .automatic)
        .chartOverlay { proxy in
             GeometryReader { geometry in
                 ZStack(alignment: .top) {
                     Rectangle().fill(.clear).contentShape(Rectangle())
                         .onTapGesture { location in
                             #if DEBUG
                             print(proxy, geometry, location)
                             #endif
                         }
                 }
             }
         }
    }
}

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    
    return VStack {
        SpeedAudioIndicator()
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
