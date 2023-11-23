//
//  PracticeViewStore.swift
//  highpitch
//
//  Created by yuncoffee on 11/7/23.
//

import Foundation
import SwiftUI
import AVFoundation

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
    var projectName: String
    
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
    var scriptViewSpeedType: SpeedViewType = .fast
    
    let AUDIO_INDICATOR_HEIGHT = 24.0
    let AUDIO_CONTROLLER_HEIGHT = 64.0
    var SCRIPT_CONTAINER_WIDTH: CGFloat {
        self.currentFeedbackViewType == .every ? 320.0 : 276.0
    }
    
    var player: AVPlayer?
    // ************* V2 ************* //
    
    init(projectName: String, practice: PracticeModel, mediaManager: MediaManager) {
        self.projectName = projectName
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
    
    func getFillerWordTypeCount() -> Int {
        var answer = 0
        for fillerword in practice.summary.eachFillerWordCount
        where fillerword.count > 0 { answer += 1 }
        return answer
    }
    
    // swiftlint: disable large_tuple
    /// (습관어, index, 습관어 사용 횟수)
    func getFillerWordGridData() -> [(String, Int, Int)] {
        var answer: [(String, Int, Int)] = []
        for fillerword in getSortedFillerWord()
        where fillerword.count > 0 && answer.count < 18 {
            answer.append((fillerword.fillerWord, answer.count + 1, fillerword.count))
        }
        while answer.count % 6 != 0 { answer.append(("", answer.count + 1, 0)) }
        if answer.isEmpty {
            for index in 1...6 {
                answer.append(("", index, 0))
            }
        }
        return answer
    }
    // swiftlint: enable large_tuple
    
    /// 가장 큰 속도 변화가 있는 부분을 반환합니다.
    func returnMostVarianceTime() -> String {
        var answer = 0
        var temp = 0.0
        let average = practice.summary.spmAverage
        for sentence in practice.sentences
        where abs(average - sentence.spmValue) >= temp {
            temp = abs(average - sentence.spmValue)
            answer = (sentence.startAt + sentence.endAt) / 2
            answer /= 1000
        }
        return "\"\(Date().secondToMS(Int(answer)))\""
    }
    
    /// (문장 중앙 시간, SPM)
    func getSentenceSpeakingRateData() -> [(Double, Double)] {
        var answer: [(Double, Double)] = []
        answer.append((0.0, practice.summary.spmAverage))
        for sentence in getSortedSentences() {
            answer.append((
                Double(sentence.startAt + sentence.endAt) / 2000.0,
                sentence.spmValue
            ))
        }
        answer.append((
            practice.summary.practiceLength,
            practice.summary.spmAverage
        ))
        return answer
    }
    
    func getEpmRange() -> (first: Double, last: Double) {
        let sortedSentences = practice.sentences.sorted(by: { $0.spmValue < $1.spmValue })
        if let firstEpmValue = sortedSentences.first?.spmValue,
           let lastEpmValue = sortedSentences.last?.spmValue {
            return (firstEpmValue, lastEpmValue)
        } else {
            return (-1, -1)
        }
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
    
    func getContainsWords(sentenceIndex: Int) -> [WordModel] {
        practice.words
            .filter({ $0.sentenceIndex == sentenceIndex })
            .sorted(by: { $0.index < $1.index })
    }
    func isFastSentence(sentenceIndex: Int) -> Bool {
        practice.summary.fastSentenceIndex.contains(sentenceIndex)
    }
    func isSlowSentence(sentenceIndex: Int) -> Bool {
        practice.summary.slowSentenceIndex.contains(sentenceIndex)
    }
    func getContainsFillerCount(sentenceIndex: Int) -> Int {
        practice.words
            .filter({$0.sentenceIndex == sentenceIndex && $0.isFillerWord })
            .count
    }
    func getDuration() -> Double {
        mediaManager.getDuration()
    }
    func playMediaFromSentence(atTime: Double, index: Int) {
        mediaManager.pausePlaying()
        mediaManager.playAt(atTime: atTime)
        nowSentence = index
        mediaManager.play()
    }
}

// MARK: - V2
extension PracticeViewStore {
    // MARK: Practice이 보여주는 Feedback 종류에 따라 다른 처리를 하기 위함
}

enum FeedbackViewType: String, CaseIterable {
    case every = "전체 보기"
    case fillerWord = "습관어"
    case speed = "말 빠르기"
}

enum SpeedViewType: Int, CaseIterable {
    case fast = 1
    case slow = 2
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
            EmptyView()
        case .fillerWord:
            FillerWordFeedbackContent()
        case .speed:
            EmptyView()
        }
    }
}
