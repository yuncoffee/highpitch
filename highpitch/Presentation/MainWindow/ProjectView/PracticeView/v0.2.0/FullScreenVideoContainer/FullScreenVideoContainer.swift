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
    private let FOOTER_HOVER_CONTAINER_HEIGHT = 54.0
    
    var body: some View {
        GeometryReader(content: { geometry in
            let maxWidth = geometry.size.width - SCRIPT_CONTAINER_WIDTH
            let maxHeight = geometry.size.height - INDICATOR_HEIGHT - VIDEO_CONTROLLER_HEIGHT - PRACTICE_HEADER_INFO_HEIGHT - VERTICAL_PADDING
            ZStack(alignment: .topLeading) {
                /// video
                VStack {
                    //                    Text("Video")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity )
                .background(viewStore.isFullScreenTransition ? Color.brown : .clear)
                .offset(
                    x: 0,
                    y: viewStore.isFullScreenTransition ? 0 : PRACTICE_HEADER_INFO_HEIGHT
                )
                headerHoverContainer
                footerHoverContainer(geoHeight: geometry.size.height)
                /// footer
                
            }
            .padding(.bottom, VIDEO_CONTROLLER_HEIGHT)
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
        .opacity(viewStore.isFullScreenVideoVisible ? 1 : 0)
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
//            viewStore.isFullScreenTransition = true
//            isFullScreenVideoHover = true
#endif
        }
    }
}

extension FullScreenVideoContainer {
    @ViewBuilder
    var headerHoverContainer: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text("\(viewStore.practice.practiceName)")
                .systemFont(.largeTitle)
                .foregroundStyle(Color.HPGray.systemWhite)
            Text("\(Date.createAtToYearMonthDayWithTime(input: viewStore.practice.creatAt))")
                .systemFont(.caption)
                .foregroundStyle(Color.HPGray.systemWhite.opacity(0.6))
            
        }
        .padding(.top, .HPSpacing.xxsmall)
        .padding(.horizontal, .HPSpacing.medium)
        .frame(maxWidth: .infinity, maxHeight: VIDEO_CONTROLLER_HEIGHT, alignment: .topLeading)
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        .HPGray.systemBlack.opacity(0.6),
                        .HPGray.systemBlack.opacity(0)
                    ]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .offset(y: viewStore.isFullScreenTransition && isFullScreenVideoHover
                ? .zero
                : -VIDEO_CONTROLLER_HEIGHT
        )
        .opacity(viewStore.isFullScreenTransition && isFullScreenVideoHover ? 1 : 0)
    }
    
    @ViewBuilder
    func footerHoverContainer(geoHeight: CGFloat) -> some View {
        HStack(alignment: .top) {
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
            .frame(maxWidth: .infinity, maxHeight: FOOTER_HOVER_CONTAINER_HEIGHT)
            .border(.blue)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: FOOTER_HOVER_CONTAINER_HEIGHT + INDICATOR_HEIGHT,
            alignment: .top
        )
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        .HPGray.systemBlack.opacity(0.6),
                        .HPGray.systemBlack.opacity(0)
                    ]),
                startPoint: .bottom,
                endPoint: .top
            )
        )
        .border(.red)
        .offset(y: viewStore.isFullScreenTransition && isFullScreenVideoHover
                ? viewStore.currentFeedbackViewType == .every
                ? geoHeight - VIDEO_CONTROLLER_HEIGHT - VERTICAL_PADDING
                : geoHeight - VIDEO_CONTROLLER_HEIGHT - INDICATOR_HEIGHT - FOOTER_HOVER_CONTAINER_HEIGHT
                : geoHeight
        )
        .opacity(viewStore.isFullScreenTransition && isFullScreenVideoHover ? 1 : 0)
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
