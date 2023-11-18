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
    var spmValue: Double
    var type: Int = 0

    init(index: Int, sentence: String, startAt: Int = -1, endAt: Int = -1, spmValue: Double = -1.0) {
        self.index = index
        self.spmValue = spmValue
        self.sentence = sentence
        self.startAt = startAt
        self.endAt = endAt
    }
}
