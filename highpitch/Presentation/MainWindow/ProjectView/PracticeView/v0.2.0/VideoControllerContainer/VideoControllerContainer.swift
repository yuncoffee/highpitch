//
//  VideoControllerContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI
//#if PREVIEW
//import SwiftData
//#endif

struct VideoControllerContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
//#if PREVIEW
//    // MARK: - MockData
//    @Query(sort: \PracticeModel.creatAt)
//    var practices: [PracticeModel]
//#endif

    var body: some View {
        VStack(spacing: .zero) {
            viewStore.currentFeedbackViewType.audioIndicator
                .frame(maxWidth:.infinity, maxHeight: viewStore.AUDIO_INDICATOR_HEIGHT)
            if let audioPath = viewStore.practice.audioPath {
                AudioControllerView(audioPlayer: viewStore.mediaManager, audioPath: audioPath)
            }
        }
    }
}

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    
    return VStack {
        VideoControllerContainer()
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
            .border(.blue)
    }
    .padding(32)
}
