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
        VStack(spacing: .HPSpacing.xsmall) {
            chartContainer
        }
        .padding(.bottom, .HPSpacing.small)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
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
    @ViewBuilder
    private var chartContainer: some View {
        HPArcodianView(label: "사용된 습관어 종류 및 횟수") {
            Text("Hello")
        }
        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .padding(.horizontal, .HPSpacing.small)
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
