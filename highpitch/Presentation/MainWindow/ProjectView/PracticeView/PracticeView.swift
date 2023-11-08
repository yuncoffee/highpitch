//
//  PracticeView.swift
//  highpitch
//
//  Created by yuncoffee on 10/13/23.
//

import SwiftUI
import AVKit

struct PracticeView: View {
    @State
    var viewStore: PracticeViewStore
    
    private var title = ""
    private var subTitle = ""
    
    init(viewStore: PracticeViewStore) {
        self.viewStore = viewStore
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HPTopToolbar(
                title: viewStore.toolbarInfo.title,
                subTitle: viewStore.toolbarInfo.subTitle,
                completion: nil
            )
            ZStack(alignment: .bottom) {
                practiceContentsContainer
                if let audioPath = viewStore.practice.audioPath {
                    AudioControllerView(audioPlayer: viewStore.mediaManager, audioPath: audioPath)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.HPGray.systemWhite)
        .ignoresSafeArea()
        .onAppear {
            viewStore.setupPracticeView()
        }
        .environment(viewStore)
    }
}

extension PracticeView {
    @ViewBuilder
    private var practiceContentsContainer: some View {
        HStack(spacing: 0) {
            /// 피드백 뷰
            FeedbackChartView()
            /// 스크립트 뷰
            ScriptView(
                sentences: viewStore.getSortedSentences(),
                words: viewStore.getSortedWords(),
                practice: viewStore.practice
            )
        }
        .padding(.top, .HPSpacing.small)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
