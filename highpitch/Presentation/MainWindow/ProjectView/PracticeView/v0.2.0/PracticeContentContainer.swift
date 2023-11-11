//
//  PracticeContentContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI
#if PREVIEW
import SwiftData
#endif

struct PracticeContentContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
#if PREVIEW
    // MARK: - MockData
    @Query(sort: \PracticeModel.creatAt)
    var practices: [PracticeModel]
#endif
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                FullScreenVideoContainer()
                SplitViewContainer()
            }
            .padding(.bottom, .HPSpacing.xxxlarge)
            VideoControllerContainer()
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

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    
    return PracticeContentContainer()
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
        .frame(width: 1000, height: 640)
}
