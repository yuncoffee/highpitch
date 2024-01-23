//
//  FillerWordAudioIndicator.swift
//  highpitch
//
//  Created by yuncoffee on 11/9/23.
//

import SwiftUI
//#if PREVIEW
//import SwiftData
//#endif

struct FillerWordAudioIndicator: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
    @State
    private var duration: Double = 0
    
//#if PREVIEW
//    // MARK: - MockData
//    @Query(sort: \PracticeModel.creatAt)
//    var practices: [PracticeModel]
//#endif
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geometry in
                let widthPercent = geometry.size.width * 0.01
                ForEach(viewStore.getSortedSentences()) { sentence in
                    let xRatio = Double(sentence.startAt * 100) / duration
                    if sentence.fillerWordCount > 0 {
                        VStack {
    //                        Text("\(fillerWordCount)")
                            Rectangle()
                                .rotation(Angle(degrees: 45.0))
                                .frame(width: 8, height: 8)
                                .foregroundStyle(
                                    sentence.fillerWordCount > 2
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
        .background(.ultraThinMaterial)
        .onAppear {
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
