//
//  FullScreenVideoContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI
//#if PREVIEW
//import SwiftData
//#endif
import AVKit

struct FullScreenVideoContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    @State
    private var isRegister = false
    
//#if PREVIEW
//    // MARK: - MockData
//    @Query(sort: \PracticeModel.creatAt)
//    var practices: [PracticeModel]
//#endif
    
    @State
    private var isFullScreenVideoHover = false
    @State
    private var isIndicatorActive: Bool = true {
        didSet {
            if !isIndicatorActive {
                viewStore.currentFeedbackViewType = .every
            } else {
                viewStore.currentFeedbackViewType = viewStore.recentFeedbackViewType
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
                    if viewStore.practice.videoPath != nil {
                        if let avPlayer = viewStore.mediaManager.avPlayer {
                            VideoView(avPlayer: avPlayer)
                        }
                    }
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
    }
}

extension FullScreenVideoContainer {
    @ViewBuilder
    var headerHoverContainer: some View {
        let subTitle = Date.createAtToYearMonthDayWithTime(input: viewStore.practice.creatAt).components(separatedBy: " • ")
        VStack(alignment: .leading, spacing: .zero) {
            Text("\(viewStore.practice.practiceName)")
                .systemFont(.largeTitle)
                .foregroundStyle(Color.HPTextStyle.white1000)
            Text("\(subTitle.first ?? "") •")
                .systemFont(.caption)
                .foregroundStyle(Color.HPTextStyle.white800)
            Text("\(subTitle.last ?? "")")
                .systemFont(.caption)
                .foregroundStyle(Color.HPTextStyle.white800)
            
        }
        .padding(.top, .HPSpacing.xxsmall)
        .padding(.horizontal, .HPSpacing.medium)
        .frame(maxWidth: .infinity, maxHeight: VIDEO_CONTROLLER_HEIGHT, alignment: .topLeading)
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color("000000").opacity(0.6),
                        Color("000000").opacity(0)
//                        .HPGray.systemBlack.opacity(0.6),
//                        .HPGray.systemBlack.opacity(0)
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
                .foregroundStyle(Color.HPTextStyle.white1000)
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
                HPHoverBox(
                    description: isIndicatorActive ? "그래프 끄기" : "그래프 켜기") {
                    currentEveryFeedbackToggleButton
                }
                HStack {
                    HPButton(
                        type: .roundFill,
                        size: .small,
                        color: viewStore.currentFeedbackViewType == .fillerWord
                        ? .HPSecondary.base
                        : .HPGray.system200
                    ) {
                        viewStore.currentFeedbackViewType = .fillerWord
                        viewStore.recentFeedbackViewType = .fillerWord
                    } label: { type, size, color, expandable in
                        HPLabel(
                            content: ("습관어", nil),
                            type: type,
                            size: size,
                            color: color,
                            contentColor: viewStore.currentFeedbackViewType == .fillerWord ? .HPTextStyle.white1000 : .HPTextStyle.base,
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
                        viewStore.recentFeedbackViewType = .speed
                    } label: { type, size, color, expandable in
                        HPLabel(
                            content: ("말 빠르기", nil),
                            type: type,
                            size: size,
                            color: color,
                            contentColor: viewStore.currentFeedbackViewType == .speed ? .HPTextStyle.white1000 : .HPTextStyle.base,
                            expandable: expandable,
                            padding: (.HPSpacing.xxxxsmall, .HPSpacing.xxsmall)
                        )
                    }
                    .fixedSize()
                }
                .disabled(!isIndicatorActive)
                HPHoverBox(description: "전체화면 종료") {
                    Image("reduceVideo")
                        .onTapGesture {
                            withAnimation {
                                viewStore.isFullScreenVideoActive = false
                            }
                        }
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: FOOTER_HOVER_CONTAINER_HEIGHT,
                alignment: .trailing
            )
        }
        .padding(.horizontal, .HPSpacing.medium)
        .frame(
            maxWidth: .infinity,
            maxHeight: FOOTER_HOVER_CONTAINER_HEIGHT + INDICATOR_HEIGHT,
            alignment: .top
        )
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color("000000").opacity(0.6),
                        Color("000000").opacity(0)
                    ]),
                startPoint: .bottom,
                endPoint: .top
            )
        )
        .offset(y: viewStore.isFullScreenTransition && isFullScreenVideoHover
                ? !isIndicatorActive
                ? geoHeight - VIDEO_CONTROLLER_HEIGHT - VERTICAL_PADDING
                : geoHeight - VIDEO_CONTROLLER_HEIGHT - INDICATOR_HEIGHT - FOOTER_HOVER_CONTAINER_HEIGHT
                : geoHeight
        )
        .opacity(viewStore.isFullScreenTransition && isFullScreenVideoHover ? 1 : 0)
        .animation(nil, value: viewStore.isFullScreenTransition)
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
