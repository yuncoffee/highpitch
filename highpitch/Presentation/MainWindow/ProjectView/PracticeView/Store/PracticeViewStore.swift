//
//  PracticeViewStore.swift
//  highpitch
//
//  Created by yuncoffee on 11/7/23.
//

import Foundation
import SwiftUI

/**
 PracticeView의 상태를 관리하기 위한 상태저장소
 */

@Observable
final class PracticeViewStore {
    /// practice root data
    var practice: PracticeModel
    var mediaManager: MediaManager
    var toolbarInfo: (title: String, subTitle: String) = (title: "", subTitle: "")
    /// 현재 선택된 문장의 인덱스
    var nowSentence = 0
    
    // ************* V2 ************* //
    
    var isFullScreenVideoVisible = false {
        didSet {
            if isFullScreenVideoVisible {
                isFullScreenTransition = true
            }
        }
    }
    
    var isFullScreenTransition = false {
        didSet {
            if !isFullScreenVideoActive {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.isFullScreenVideoActive = true
                }
            }
        }
    }
    
    var isFullScreenVideoActive = true {
        didSet {
            if !isFullScreenVideoActive {
                isFullScreenTransition = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    self.isFullScreenVideoVisible = false
                }
            }
        }
    }
    
    var currentFeedbackViewType: FeedbackViewType = .fillerWord
    
    // ************* V2 ************* //
    
    init(practice: PracticeModel, mediaManager: MediaManager) {
        self.practice = practice
        self.mediaManager = mediaManager
    }
}

extension PracticeViewStore {
    func setupPracticeView() {
        practice.utterances.sort { $0.startAt < $1.startAt }
        if !practice.isVisited {
            practice.isVisited = true
        }
        /// 연습 메타데이터(연습 횟수, 연습일)
        toolbarInfo.title = practice.practiceName.description
        toolbarInfo.subTitle = Date().createAtToYMD(input: practice.creatAt.description) +
        " | " + Date().createAtToHMS(input: practice.creatAt.description)
    }
    
    func getSortedSentences() -> [SentenceModel] {
        practice.sentences.sorted(by: { $0.index < $1.index })
    }
    
    func getSortedWords() -> [WordModel] {
        practice.words.sorted(by: { $0.index < $1.index })
    }
    
    func getSortedFillerWord() -> [FillerWordModel] {
        practice.summary.eachFillerWordCount.sorted(by: {$0.count > $1.count})
    }
    
    func getEpmRange() -> [Double] {
        let sortedSentences = practice.sentences.sorted(by: { $0.epmValue < $1.epmValue })
        return [sortedSentences.first!.epmValue, sortedSentences.last!.epmValue]
    }
        
    func isFastSentenceEmpty() -> Bool {
        practice.summary.fastSentenceIndex.isEmpty
    }
    
    func isSlowSentenceEmpty() -> Bool {
        practice.summary.slowSentenceIndex.isEmpty
    }
    
    func hasFillerWord() -> Bool {
        practice.summary.fillerWordCount > 0
    }
}

// MARK: - V2
extension PracticeViewStore {
    // MARK: Practice이 보여주는 Feedback 종류에 따라 다른 처리를 하기 위함
}

enum FeedbackViewType {
    case every
    case fillerWord
    case speed
}

extension FeedbackViewType {
    @ViewBuilder
    var audioIndicator: some View {
        switch self {
        case .every:
            EmptyView()
        case .fillerWord:
            FillerWordAudioIndicator()
        case .speed:
            SpeedAudioIndicator()
        }
    }
    
    @ViewBuilder
    var feedbackContent: some View {
        switch self {
        case .every:
            EveryFeedbackContent()
        case .fillerWord:
            FillerWordFeedbackContent()
        case .speed:
            SpeedFeedbackContent()
        }
    }
}
