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
    
    // MARK: - 시간 초과한 프로젝트인 경우 체크 -> viewStore.practice.summary로 이동해야함.
    @State
    private var isTimeOverPractice = true
    
    @State
    private var isVideoHover = false
    
//#if PREVIEW
//    // MARK: - MockData
//    @Query(sort: \PracticeModel.creatAt)
//    var practices: [PracticeModel]
//#endif
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            header
            videoView
            if !viewStore.isFullScreenTransition {
                VideoControllerContainer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            // MARK: - Add MockData
//#if PREVIEW
//            if let sample = practices.first {
//                viewStore.practice = sample
//            }
//#endif
        }
    }
}

extension VideoContainer {
    private func parseDateStyle(input: String) -> String {
        Date.createAtToYearMonthDayWithTime(input: input)
    }
    
    private func calcAudioIndicatorSize() -> CGFloat {
        viewStore.currentFeedbackViewType != .every ? viewStore.AUDIO_INDICATOR_HEIGHT : .zero
    }
    private func parseDurationToLabel(duration: Double) -> String {
        var result = ""
        let _duration = Int(duration)
        
        let hour =  _duration / 3600
        let minute = _duration % 3600 / 60
        let second = _duration % 60
        
        if hour > 0 {
            result += "\(hour)시"
        }
        if minute > 0 {
            result += "\(minute)분"
        }
        if second > 0 {
            result += "\(second)초"
        }

        return result
    }

}

extension VideoContainer {
    @ViewBuilder
    private var header: some View {
        VStack(alignment: .leading, spacing: .HPSpacing.xxxsmall) {
            VStack(alignment: .leading, spacing: .HPSpacing.xxxxsmall) {
                Text("\(parseDateStyle(input: viewStore.practice.creatAt))")
                    .systemFont(.caption)
                    .foregroundStyle(Color.HPTextStyle.light)
                Text("\(viewStore.practice.practiceName)")
                    .systemFont(.largeTitle)
            }
            HPLabel(
                content: (
                    "\(parseDurationToLabel(duration: viewStore.mediaManager.getDuration())) 소요",
                    "clock"
                ),
                type: .blockFill(4),
                color: .HPGray.system200,
                alignStyle: .iconWithText,
                contentColor: .HPTextStyle.dark,
                fontStyle: .styled(.detailTimeFeedback),
                padding: (.HPSpacing.xxxxsmall, .HPSpacing.xxxsmall)
            )
            .fixedSize()
        }
        .padding(.top, .HPSpacing.small + .HPSpacing.xxxxsmall)
        .padding(.leading, .HPSpacing.small)
    }
    
    @ViewBuilder
    private var videoView: some View {
        VStack {
            // MARK: - 영상으로 대체
            GeometryReader { geometry in
                let maxHeight = geometry.size.height - 96
                ZStack(alignment: .bottom) {
                    VStack {
                        if viewStore.practice.videoPath != nil {
                            if let avPlayer = viewStore.mediaManager.avPlayer {
                                VideoView(avPlayer: avPlayer)
                            }
                        }
                    }
                    HStack {
                        Button {
                            withAnimation {
                                viewStore.isFullScreenVideoVisible = true
                                viewStore.currentFeedbackViewType = .fillerWord
                            }
                        } label: {
                            Image("expandVideo")
                        }
                        .buttonStyle(.plain)
                        .padding(.bottom, .HPSpacing.xsmall)
                        .padding(.trailing, .HPSpacing.xsmall)
                        .onTapGesture {
                            withAnimation {
                                viewStore.isFullScreenVideoVisible = true
                                viewStore.currentFeedbackViewType = .fillerWord
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 40, alignment: .bottomTrailing)
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
                    .offset(y: isVideoHover ? 0 : 40)
                }
                .clipped()
                .frame(
                    width: geometry.size.width,
                    height: maxHeight,
                    alignment: .bottom
                )
                .background(Color.black.opacity(0.3))
                .onHover { hovering in
                    withAnimation {
                        isVideoHover = hovering
                    }
                }
            }
        }
        .padding(.vertical, .HPSpacing.xlarge)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    
    return VStack {
        VideoContainer()
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
    .frame(minHeight: 480)
    .padding(24)
}
