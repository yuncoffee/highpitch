//
//  PracticeViewStore.swift
//  highpitch
//
//  Created by yuncoffee on 11/7/23.
//

import Foundation

/**
 PracticeView의 상태를 관리하기 위한 상태저장소
 */

@Observable
final class PracticeViewStore {
    /// practice root data
    var practice: PracticeModel
    var mediaManager: MediaManager
    var toolbarInfo: (title: String, subTitle: String) = (title: "", subTitle: "")
    
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

// MARK: - UsageTopTierChart
extension PracticeViewStore {
    
}
