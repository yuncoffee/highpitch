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
        VStack {
            Text("every")
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
    return VStack {
        EveryFeedbackContent()
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
    .frame(minWidth: 440, maxWidth: 440,  minHeight: 600)
    .padding(24)
}
