//
//  PracticeModel.swift
//  highpitch
//
//  Created by 이재혁 on 10/17/23.
//

import Foundation
import SwiftData

/// 제거사항

/// 추가사항
/// 1. remarkable: Bool
/// 2. projectID: persistentID

@Model
class PracticeModel: Comparable {
    var practiceName: String
    var index: Int
    var isVisited: Bool
    var creatAt: String
    var audioPath: URL?
    var videoPath: URL?
    @Relationship(deleteRule: .cascade)
    var utterances: [UtteranceModel]
    @Relationship(deleteRule: .cascade)
    var words: [WordModel]
    @Relationship(deleteRule: .cascade)
    var sentences: [SentenceModel]
    @Relationship(deleteRule: .cascade)
    var summary: PracticeSummaryModel
    var remarkable: Bool
    var projectCreatAt: String
    
    init(
        practiceName: String,
        index: Int,
        isVisited: Bool,
        creatAt: String,
        audioPath: URL? = nil,
        utterances: [UtteranceModel],
        words: [WordModel] = [],
        sentences: [SentenceModel] = [],
        summary: PracticeSummaryModel,
        remarkable: Bool = false,
        projectCreatAt: String = ""
    ) {
        self.practiceName = practiceName
        self.index = index
        self.isVisited = isVisited
        self.creatAt = creatAt
        self.audioPath = audioPath
        self.utterances = utterances
        self.words = words
        self.sentences = sentences
        self.summary = summary
        self.remarkable = remarkable
        self.projectCreatAt = projectCreatAt
    }
    
    static func < (lhs: PracticeModel, rhs: PracticeModel) -> Bool {
        return lhs.creatAt < rhs.creatAt
    }

    static func == (lhs: PracticeModel, rhs: PracticeModel) -> Bool {
        return lhs.creatAt == rhs.creatAt
    }
}
