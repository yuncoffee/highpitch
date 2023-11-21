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
    
#if PREVIEW
    // MARK: - MockData
    @Query(sort: \PracticeModel.creatAt)
    var practices: [PracticeModel]
#endif
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            header
            videoView
            if !viewStore.isFullScreenTransition {
                VideoControllerContainer()
            }
        }
//        .padding(.bottom, calcAudioIndicatorSize())
//        .padding(.bottom, 64)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    private func parseDateStyle(input: String) -> String {
        Date.createAtToYearMonthDayWithTime(input: input)
    }
    
    private func calcAudioIndicatorSize() -> CGFloat {
        viewStore.currentFeedbackViewType != .every ? viewStore.AUDIO_INDICATOR_HEIGHT : .zero
    }
}

extension VideoContainer {
    @ViewBuilder
    private var header: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text("\(parseDateStyle(input: viewStore.practice.creatAt))")
                .systemFont(.caption)
                .foregroundStyle(Color.HPTextStyle.light)
            Text("\(viewStore.practice.practiceName)")
                .systemFont(.largeTitle)
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
                VStack {
                    if let audioPath = viewStore.practice.audioPath,
                       let avPlayer = viewStore.mediaManager.avPlayer {
                        VideoView(videoURL: audioPath, avPlayer: avPlayer)
                            .onTapGesture {
                                withAnimation {
                                    viewStore.isFullScreenVideoVisible = true
                                    viewStore.currentFeedbackViewType = .fillerWord
                                }
                            }
                            .border(.blue)
                    }
                }
                .frame(
                    width: geometry.size.width,
                    height: maxHeight
                )
                .background(Color.red.opacity(0.3))
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
