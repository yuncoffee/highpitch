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
    
    private let INDICATOR_HEIGHT = 32.0
    
    var body: some View {
        GeometryReader(content: { geometry in
            let maxHeight = geometry.size.height - 96
            ZStack(alignment: .topLeading) {
                /// video
                VStack {
                    Text("geowidth \(geometry.size.width)")
                    Text("geoheight \(geometry.size.height)")
                    Text("Video")
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(Color.brown)
                .offset(
                    x: 0,
                    y: viewStore.isFullScreenTransition ? 0 : 168
                )
                VStack {
                    Text("Title")
                    Text("subTitle")
                }
                .frame(maxWidth: .infinity, maxHeight: 64, alignment: .topLeading)
                .background(Color.purple)
                .offset(y: viewStore.isFullScreenTransition && isFullScreenVideoHover
                        ? .zero
                        : -64
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
                        ? geometry.size.height - 150
                        : geometry.size.height
                )
                .opacity(viewStore.isFullScreenTransition ? 1 : 0)
                .onTapGesture {
                    print("HELL?O?")
                }
            }
            .frame(
                maxWidth: viewStore.isFullScreenTransition ? .infinity : geometry.size.width - 440,
                maxHeight: viewStore.isFullScreenTransition ? .infinity : geometry.size.height - 96 - 168 - 48
            )
            .border(.green)
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
