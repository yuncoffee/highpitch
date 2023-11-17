//
//  PracticeSummaryModel.swift
//  highpitch
//
//  Created by 이용준의 Macbook on 10/19/23.
//

import Foundation
import SwiftData

/// 제거사항
/// 1. fillerWordPercentage
/// 2. level
/// 3. epmAverage

/// 추가사항
/// 1. practiceLength: Double
/// 2. fwpm: Double
/// 3. spmAverage: Double

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
    @Attribute(originalName: "empAverage")
    var spmAverage: Double
    var practiceLength: Double = -1.0
    var fwpm: Double = -1.0
    
    init(
        syllableSum: Int = 0,
        durationSum: Int = 0,
        wordCount: Int = 0,
        fillerWordCount: Int = 0,
        eachFillerWordCount: [FillerWordModel] = [],
        fastSentenceIndex: [Int] = [],
        slowSentenceIndex: [Int] = [],
        spmAverage: Double = -1.0
    ) {
        self.syllableSum = syllableSum
        self.durationSum = durationSum
        self.wordCount = wordCount
        self.fillerWordCount = fillerWordCount
        self.eachFillerWordCount = eachFillerWordCount
        self.fastSentenceIndex = fastSentenceIndex
        self.slowSentenceIndex = slowSentenceIndex
        self.spmAverage = spmAverage
    }
}
