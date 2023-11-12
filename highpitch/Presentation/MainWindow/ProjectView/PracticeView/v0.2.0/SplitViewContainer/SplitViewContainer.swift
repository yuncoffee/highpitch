//
//  SplitViewContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI
#if PREVIEW
import SwiftData
#endif

struct SplitViewContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
#if PREVIEW
    // MARK: - MockData
    @Query(sort: \PracticeModel.creatAt)
    var practices: [PracticeModel]
#endif
    
    var body: some View {
        HStack(spacing: .zero) {
            VideoContainer()
            PracticeDetailContainer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .zIndex(viewStore.isFullScreenVideoVisible ? 0 : 1)
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
    
    return SplitViewContainer()
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
        .background(Color.HPGray.systemWhite)
}
