//
//  VideoContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI
import SwiftData

struct VideoContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
    #if PREVIEW
    // MARK: - MockData
    @Query(sort: \PracticeModel.creatAt)
    var practices: [PracticeModel]
    #endif
    
    var body: some View {
        VStack {
            VStack {
                header
            }
            VStack {
                Text("Video Active")
                    .onTapGesture {
                        withAnimation {
                            //                            viewStore.isFullScreenVideoVisible = true
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .background(Color.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange)
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

extension VideoContainer {
    @ViewBuilder
    private var header: some View {
        VStack(spacing: 0) {
            Text("NAME \(viewStore.practice.practiceName)")
            Text("\(viewStore.practice.creatAt)")
                .systemFont(.body)
            Text("\(viewStore.practice.practiceName) 번째 연습")
        }
    }
}

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    
    return VStack {
        VideoContainer()
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
    .padding(24)
}
