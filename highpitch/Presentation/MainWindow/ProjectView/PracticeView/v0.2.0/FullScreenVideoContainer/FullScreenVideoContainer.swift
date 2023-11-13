//
//  FullScreenVideoContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI
#if PREVIEW
import SwiftData
#endif

struct FullScreenVideoContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
#if PREVIEW
    // MARK: - MockData
    @Query(sort: \PracticeModel.creatAt)
    var practices: [PracticeModel]
#endif
    
    @State
    private var isFullScreenVideoHover = false
    
    private let SCRIPT_CONTAINER_WIDTH = 440.0
    private let INDICATOR_HEIGHT = 32.0
    private let PRACTICE_HEADER_INFO_HEIGHT = 168.0
    private let VIDEO_CONTROLLER_HEIGHT = 64.0
    private let VERTICAL_PADDING = 48.0
    
    var body: some View {
        GeometryReader(content: { geometry in
            let maxWidth = geometry.size.width - SCRIPT_CONTAINER_WIDTH
            let maxHeight = geometry.size.height - INDICATOR_HEIGHT - VIDEO_CONTROLLER_HEIGHT - PRACTICE_HEADER_INFO_HEIGHT - VERTICAL_PADDING
            
            ZStack(alignment: .topLeading) {
                /// video
                VStack {
//                    Text("Video")
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(viewStore.isFullScreenTransition ? Color.brown : .clear)
                .offset(
                    x: 0,
                    y: viewStore.isFullScreenTransition ? 0 : PRACTICE_HEADER_INFO_HEIGHT
                )
                VStack {
                    Text("Title")
                    Text("subTitle")
                }
                .frame(maxWidth: .infinity, maxHeight: VIDEO_CONTROLLER_HEIGHT, alignment: .topLeading)
                .background(Color.purple)
                .offset(y: viewStore.isFullScreenTransition && isFullScreenVideoHover
                        ? .zero
                        : -VIDEO_CONTROLLER_HEIGHT
                )
                .opacity(viewStore.isFullScreenTransition ? 1 : 0)
                /// footer
                HStack {
                    Text("토글")
                    Text("토글토글")
                    Text("토글토글토글")
                    Text("전체화면")
                        .onTapGesture {
                            withAnimation {
                                viewStore.isFullScreenVideoActive = false
                            }
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: 56)
                .background(Color.blue)
                .offset(y: viewStore.isFullScreenTransition && isFullScreenVideoHover
                        ? viewStore.currentFeedbackViewType == .every
                        ? geometry.size.height - VIDEO_CONTROLLER_HEIGHT - VERTICAL_PADDING
                        : geometry.size.height - 150
                        : geometry.size.height
                )
                .opacity(viewStore.isFullScreenTransition ? 1 : 0)
                .onTapGesture {
                    print("HELL?O?")
                }
            }
            .frame(
                maxWidth: viewStore.isFullScreenTransition ? .infinity : maxWidth,
                maxHeight: viewStore.isFullScreenTransition ? .infinity : maxHeight
            )
            .onHover { hovering in
                withAnimation {
                    isFullScreenVideoHover = hovering
                }
            }
        })
        .zIndex(viewStore.isFullScreenVideoVisible ? 1 : 0)
        .onAppear {
            // MARK: - Add MockData
#if PREVIEW
            if let sample = practices.first {
                viewStore.practice = sample
            }
            let url = Bundle.main.url(forResource: "20231107202138", withExtension: "m4a")
            if let url = url {
                viewStore.practice.audioPath = url
            }
            viewStore.isFullScreenVideoActive = true
#endif
        }
    }
}

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    
    return FullScreenVideoContainer()
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
