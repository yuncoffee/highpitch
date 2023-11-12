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
    private var planedTime = "7분 30초"
    @State
    private var overedTime = "3분 15초"
    
#if PREVIEW
    // MARK: - MockData
    @Query(sort: \PracticeModel.creatAt)
    var practices: [PracticeModel]
#endif
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            header
            videoView
        }
        .padding(.bottom, calcAudioIndicatorSize())
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
//        viewStore.currentFeedbackViewType != .every ? viewStore.AUDIO_INDICATOR_HEIGHT : .zero
        .zero
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
            HStack {
                HPLabel(
                    content: ("목표시간 \(planedTime)", "clock"),
                    type: .blockFill(4),
                    color: .HPGray.system200,
                    alignStyle: .iconWithText,
                    contentColor: .HPTextStyle.dark,
                    fontStyle: .styled(.detailTimeFeedback),
                    padding: (.HPSpacing.xxxxsmall, .HPSpacing.xxxsmall)
                )
                .fixedSize()
                if isTimeOverPractice {
                    HPLabel(
                        content: ("+ \(overedTime) 초과", nil),
                        type: .blockFill(4),
                        color: .HPComponent.TimeFeedback.background,
                        alignStyle: .iconWithText,
                        contentColor: .HPComponent.TimeFeedback.text,
                        fontStyle: .styled(.detailTimeFeedback),
                        padding: (.HPSpacing.xxxxsmall, .HPSpacing.xxxsmall)
                        
                    )
                    .fixedSize()
                }
            }
        }
        .padding(.top, .HPSpacing.small + .HPSpacing.xxxxsmall)
        .padding(.leading, .HPSpacing.small)
    }
    
    @ViewBuilder
    private var videoView: some View {
        GeometryReader { geometry in
            VStack {
                // MARK: - 영상으로 대체
                Text("Video Active")
                    .onTapGesture {
                        withAnimation {
                            viewStore.isFullScreenVideoVisible = true
                        }
                    }
                    .frame(
                        maxWidth: geometry.size.width,
                        minHeight: geometry.size.width / 16 * 10
                    )
                    .background(Color.gray)
            }
            .padding(.vertical, .HPSpacing.xlarge)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    .frame(minHeight: 600)
    .padding(24)
}
