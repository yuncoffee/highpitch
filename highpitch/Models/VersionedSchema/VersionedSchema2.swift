//
//  VersionedSchema2.swift
//  highpitch
//
//  Created by 이재혁 on 11/16/23.
//

import SwiftData
import SwiftUI

enum Schema2: VersionedSchema {
    static var versionIdentifier: Schema.Version = .init(0, 0, 2)
    
    static var models: [any PersistentModel.Type] {
        [ProjectModel.self, PracticeModel.self, UtteranceModel.self, WordModel.self, SentenceModel.self, PracticeSummaryModel.self, FillerWordModel.self]
    }
    
    @Model
    class ProjectModel {
        var projectName: String
        var creatAt: String
        var keynotePath: URL?
        var keynoteCreation: String // 키노트 파일에서 생성일을 조회해서 넣어줌 스트링으로.  FileSystemManager에 있는 getCreationMetadata함수에 path를 전달하면 keynoteCreation 반환해줌.
        @Relationship(deleteRule: .cascade)
        var practices = [PracticeModel]()
        
        init(projectName: String, creatAt: String, keynotePath: URL? = nil, keynoteCreation: String) {
            self.projectName = projectName
            self.creatAt = creatAt
            self.keynotePath = keynotePath
            self.keynoteCreation = keynoteCreation
        }
    }
    
    @Model
    class PracticeModel: Comparable {
        var practiceName: String
        var index: Int
        var isVisited: Bool
        var creatAt: String
        var audioPath: URL?
        @Relationship(deleteRule: .cascade)
        var utterances: [UtteranceModel]
        @Relationship(deleteRule: .cascade)
        var words: [WordModel]
        @Relationship(deleteRule: .cascade)
        var sentences: [SentenceModel]
        @Relationship(deleteRule: .cascade)
        var summary: PracticeSummaryModel
        var remarkable: Bool = false
        var projectCreatAt: String = ""
        
        init(
            practiceName: String,
            index: Int,
            isVisited: Bool,
            creatAt: String,
            audioPath: URL? = nil,
            utterances: [UtteranceModel],
            words: [WordModel] = [],
            sentences: [SentenceModel] = [],
            summary: PracticeSummaryModel
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
        }
        
        static func < (lhs: PracticeModel, rhs: PracticeModel) -> Bool {
            return lhs.creatAt < rhs.creatAt
        }

        static func == (lhs: PracticeModel, rhs: PracticeModel) -> Bool {
            return lhs.creatAt == rhs.creatAt
        }
    }

    @Model
    class UtteranceModel: Comparable {
        var startAt: Int
        var duration: Int
        var message: String
        
        init(startAt: Int, duration: Int, message: String) {
            self.startAt = startAt
            self.duration = duration
            self.message = message
        }
        
        static func < (lhs: UtteranceModel, rhs: UtteranceModel) -> Bool {
            return lhs.startAt < rhs.startAt
        }

        static func == (lhs: UtteranceModel, rhs: UtteranceModel) -> Bool {
            return lhs.startAt == rhs.startAt
        }
    }
    
    @Model
    class WordModel {
        var isFillerWord: Bool
        var sentenceIndex: Int
        var index: Int
        var word: String
        
        init(isFillerWord: Bool, sentenceIndex: Int, index: Int, word: String) {
            self.isFillerWord = isFillerWord
            self.sentenceIndex = sentenceIndex
            self.index = index
            self.word = word
        }
    }

    @Model
    class SentenceModel {
        var index: Int
        var sentence: String
        var startAt: Int
        var endAt: Int
        var epmValue: Double
        var spmValue: Double = -1.0
        var fastOrSlow: Int = 0
        
        init(index: Int, sentence: String, startAt: Int = -1, endAt: Int = -1, epmValue: Double = -1.0) {
            self.index = index
            self.epmValue = epmValue
            self.sentence = sentence
            self.startAt = startAt
            self.endAt = endAt
        }
    }

    @Model
    class PracticeSummaryModel {
        var syllableSum: Int
        var durationSum: Int
        var wordCount: Int
        var fillerWordCount: Int
        @Relationship(deleteRule: .cascade)
        var eachFillerWordCount: [FillerWordModel]
        var fastSentenceIndex: [Int]
        var slowSentenceIndex: [Int]
        var fillerWordPercentage: Double
        var epmAverage: Double
        var level: Double
        var practiceLength: Double = -1.0
        var fwpm: Double = -1.0
        var spmAverage: Double = -1.0
        
        init(
            syllableSum: Int = 0,
            durationSum: Int = 0,
            wordCount: Int = 0,
            fillerWordCount: Int = 0,
            eachFillerWordCount: [FillerWordModel] = [],
            fastSentenceIndex: [Int] = [],
            slowSentenceIndex: [Int] = [],
            fillerWordPercentage: Double = -1.0,
            epmAverage: Double = -1.0,
            level: Double = -1.0
        ) {
            self.syllableSum = syllableSum
            self.durationSum = durationSum
            self.wordCount = wordCount
            self.fillerWordCount = fillerWordCount
            self.eachFillerWordCount = eachFillerWordCount
            self.fastSentenceIndex = fastSentenceIndex
            self.slowSentenceIndex = slowSentenceIndex
            self.fillerWordPercentage = fillerWordPercentage
            self.epmAverage = epmAverage
            self.level = level
        }
    }

    @Model
    class FillerWordModel {
        var fillerWord: String
        var count: Int
        
        init(fillerWord: String, count: Int = 0) {
            self.fillerWord = fillerWord
            self.count = count
        }
    }

}
