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
    @State
    private var isIndicatorActive: Bool = true {
        didSet {
            if !isIndicatorActive {
                viewStore.currentFeedbackViewType = .every
            } else {
                viewStore.currentFeedbackViewType = .fillerWord
            }
        }
    }
    
    private let SCRIPT_CONTAINER_WIDTH = 440.0
    private let INDICATOR_HEIGHT = 32.0
    private let PRACTICE_HEADER_INFO_HEIGHT = 142.0
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
            viewStore.isFullScreenTransition = true
            viewStore.isFullScreenVideoVisible = true
            isFullScreenVideoHover = true
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
    var currentEveryFeedbackToggleButton: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 30, height: 10)
                .foregroundStyle(
                    isIndicatorActive
                    ? Color.HPPrimary.base
                    : Color.HPGray.system400
                )
            Circle()
                .frame(width: 18, height: 18)
                .foregroundStyle(
                    isIndicatorActive
                    ? Color.HPGray.systemWhite
                    : Color.HPGray.system200
                )
                .offset(x: isIndicatorActive ? 16 : -2 )
        }
        .onTapGesture {
            withAnimation {
                isIndicatorActive.toggle()
            }
        }
    }
    
    @ViewBuilder
    func footerHoverContainer(geoHeight: CGFloat) -> some View {
        HStack(alignment: .top) {
            HStack(spacing: .HPSpacing.xxsmall) {
                // 인디케이터가 보이게 하는 친구
                currentEveryFeedbackToggleButton
                if isIndicatorActive {
                    HStack {
                        HPButton(
                            type: .roundFill,
                            size: .small,
                            color: viewStore.currentFeedbackViewType == .fillerWord
                                ? .HPSecondary.base
                                : .HPGray.system200
                        ) {
                            viewStore.currentFeedbackViewType = .fillerWord
                        } label: { type, size, color, expandable in
                            HPLabel(
                                content: ("습관어", nil),
                                type: type,
                                size: size,
                                color: color,
                                contentColor: viewStore.currentFeedbackViewType == .fillerWord ? nil : .HPTextStyle.base,
                                expandable: expandable,
                                padding: (.HPSpacing.xxxxsmall, .HPSpacing.xxsmall)
                            )
                        }
                        .fixedSize()
                        HPButton(
                            type: .roundFill,
                            size: .small,
                            color: viewStore.currentFeedbackViewType == .speed
                            ? .HPSecondary.base
                            : .HPGray.system200
                        ) {
                            viewStore.currentFeedbackViewType = .speed
                        } label: { type, size, color, expandable in
                            HPLabel(
                                content: ("말 빠르기", nil),
                                type: type,
                                size: size,
                                color: color,
                                contentColor: viewStore.currentFeedbackViewType == .speed ? nil : .HPTextStyle.base,
                                expandable: expandable,
                                padding: (.HPSpacing.xxxxsmall, .HPSpacing.xxsmall)
                            )
                        }
                        .fixedSize()
                    }
                }
                Image("expandVideo")
                    .onTapGesture {
                        withAnimation {
                            viewStore.isFullScreenVideoActive = false
                        }
                    }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: FOOTER_HOVER_CONTAINER_HEIGHT,
                alignment: .trailing
            )
        }
        .padding(.horizontal, .HPSpacing.xsmall)
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
