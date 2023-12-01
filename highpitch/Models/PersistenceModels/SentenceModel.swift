//
//  SentenceModel.swift
//  highpitch
//
//  Created by 이용준의 Macbook on 10/19/23.
//

import Foundation
import SwiftData

/// 제거사항
/// 1. epmValue

/// 추가사항
/// 1. spmValue: Double
/// 2. fastOrSlow: Int

@Model
class SentenceModel {
    var index: Int
    var sentence: String
    var startAt: Int
    var endAt: Int
    @Attribute(originalName: "empValue")
    var spmValue: Double
    /// 0: defalut, 1: fast, 2: slow
    var type: Int = SpeedType.default.rawValue
    var fillerWordCount: Int = 0
    
    init(index: Int, sentence: String, startAt: Int = -1, endAt: Int = -1, spmValue: Double = -1.0, fillerWordCount: Int = 0) {
        self.index = index
        self.spmValue = spmValue
        self.sentence = sentence
        self.startAt = startAt
        self.endAt = endAt
        self.fillerWordCount = fillerWordCount
    }
}

enum SpeedType: Int {
    case `default` = 0
    case fast = 1
    case slow = 2
}
