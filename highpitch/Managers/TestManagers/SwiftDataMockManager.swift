//
//  SwiftDataMockManager.swift
//  highpitch
//
//  Created by yuncoffee on 11/9/23.
//

import Foundation
import SwiftData

// swiftlint: disable type_body_length line_length
@MainActor
class SwiftDataMockManager {
    static let previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: PracticeModel.self, configurations: config)

            let samplePractice = PracticeModel(
                practiceName: "Practice1",
                index: 0,
                isVisited: false,
                creatAt: Date.now.description,
                utterances: [],
                summary: PracticeSummaryModel()
            )
            container.mainContext.insert(SamplePracticeModel)

            return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }()
    
    static let SamplePracticeModel = PracticeModel(
        practiceName: "첫번째 연습",
        index: 0,
        isVisited: false,
        creatAt: "2023-11-07 20:21:38 GMT+09:00",
        audioPath: URL(string: "file:///Users/coffee/Library/Containers/com.windup.highpitch/Data/Documents/HighPitch/Audio/20231107202138.m4a"),
        utterances: [
            UtteranceModel(
                startAt: 26387,
                duration: 19549,
                message: "죄송해 봐 게 같래 난 좀 안 썼던 것 같아 녹음 중에 와서 그런가 이게 떠 있을 텐어 왔어."
            ),
            UtteranceModel(
                startAt: 21013,
                duration: 5314,
                message: "이게 환면 기록 화면 기록도 저런 게 뜰 텐데 몰랐어요."
            ),
            UtteranceModel(
                startAt: 14773,
                duration: 6090,
                message: "이거 이런 식으로 녹음 중이라 상태를 알고 있는데 얘를 두 번 보여줄 이유가 있을까요?"
            ),
            UtteranceModel(
                startAt: 2250,
                duration: 12503,
                message: "이거 기본 시스템 상해서 아니 없어도 이게 이렇게 뜨거든요 고요."
            )
        ],
        words: [
            WordModel(
                isFillerWord: false,
                sentenceIndex: 2,
                index: 30,
                word: "게 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 0,
                index: 9,
                word: "고요."
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 2,
                index: 26,
                word: "기록 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 0,
                index: 2,
                word: "시스템 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 39,
                word: "좀 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 0,
                index: 3,
                word: "상해서 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 0,
                index: 8,
                word: "뜨거든요 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 0,
                index: 5,
                word: "없어도 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 15,
                word: "상태를 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 14,
                word: "중이라 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 37,
                word: "갈래 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 44,
                word: "녹음 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 20,
                word: "번 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 52,
                word: "왔어."
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 2,
                index: 31,
                word: "뜰 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 13,
                word: "녹음 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 0,
                index: 1,
                word: "기본 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 23,
                word: "있을까요?"
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 2,
                index: 33,
                word: "몰랐어요."
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 2,
                index: 29,
                word: "저런 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 47,
                word: "그런가 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 12,
                word: "식으로 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 48,
                word: "이게 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 2,
                index: 28,
                word: "기록도 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 43,
                word: "같아 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 34,
                word: "죄송해 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 42,
                word: "것 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 0,
                index: 6,
                word: "이게 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 41,
                word: "썼던 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 36,
                word: "게 "
            ),
            WordModel(
                isFillerWord: true,
                sentenceIndex: 0,
                index: 4,
                word: "아니 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 40,
                word: "안 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 2,
                index: 27,
                word: "화면 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 11,
                word: "이런 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 10,
                word: "이거 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 2,
                index: 32,
                word: "텐데 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 50,
                word: "있을 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 21,
                word: "보여줄 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 2,
                index: 24,
                word: "이게 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 0,
                index: 0,
                word: "이거 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 35,
                word: "봐 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 49,
                word: "떠 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 19,
                word: "두 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 22,
                word: "이유가 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 18,
                word: "얘를 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 45,
                word: "중에 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 0,
                index: 7,
                word: "이렇게 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 51,
                word: "텐어 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 17,
                word: "있는데 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 1,
                index: 16,
                word: "알고 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 2,
                index: 25,
                word: "환면 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 38,
                word: "난 "
            ),
            WordModel(
                isFillerWord: false,
                sentenceIndex: 3,
                index: 46,
                word: "와서 "
            )
        ],
        sentences: [
            SentenceModel(
                index: 3,
                sentence: "죄송해 봐 게 같래 난 좀 안 썼던 것 같아 녹음 중에 와서 그런가 이게 떠 있을 텐어 왔어.",
                startAt: 26387,
                endAt: 45936,
                epmValue: 101.2839531433833
            ),
            SentenceModel(
                index: 2,
                sentence: "이게 환면 기록 화면 기록도 저런 게 뜰 텐데 몰랐어요.",
                startAt: 21013,
                endAt: 26327,
                epmValue: 237.10952201731277
            ),
            SentenceModel(
                index: 0,
                sentence: "이거 기본 시스템 상해서 아니 없어도 이게 이렇게 뜨거든요 고요.",
                startAt: 2250,
                endAt: 14753,
                epmValue: 124.77005518675517
            ),
            SentenceModel(
                index: 1,
                sentence: "이거 이런 식으로 녹음 중이라 상태를 알고 있는데 얘를 두 번 보여줄 이유가 있을까요?",
                startAt: 14773,
                endAt: 20863,
                epmValue: 344.82758620689657
            )
        ],
//        summary: PracticeSummaryModel()
        summary: PracticeSummaryModel(
            syllableSum: 115,
            durationSum: 43456,
            wordCount: 53,
            fillerWordCount: 1,
            eachFillerWordCount: [
                FillerWordModel(fillerWord: "아니", count: 1),
                FillerWordModel(fillerWord: "막", count: 0),
                FillerWordModel(fillerWord: "뭐였더라", count: 0),
                FillerWordModel(fillerWord: "그니깐", count: 0),
                FillerWordModel(fillerWord: "어", count: 0),
                FillerWordModel(fillerWord: "저기", count: 0),
                FillerWordModel(fillerWord: "흠", count: 0),
                FillerWordModel(fillerWord: "봐봐", count: 0),
                FillerWordModel(fillerWord: "사실은", count: 0),
                FillerWordModel(fillerWord: "뭔가", count: 0),
                FillerWordModel(fillerWord: "그러니까", count: 0),
                FillerWordModel(fillerWord: "뭐지", count: 0),
                FillerWordModel(fillerWord: "근데", count: 0),
                FillerWordModel(fillerWord: "약간", count: 0),
                FillerWordModel(fillerWord: "인제", count: 0),
                FillerWordModel(fillerWord: "음", count: 0),
                FillerWordModel(fillerWord: "아", count: 0),
                FillerWordModel(fillerWord: "뭐", count: 0),
                FillerWordModel(fillerWord: "뭐였지", count: 0),
                FillerWordModel(fillerWord: "이제", count: 0),
                FillerWordModel(fillerWord: "그래서", count: 0)
            ],
            fastSentenceIndex: [1],
            slowSentenceIndex: [],
            fillerWordPercentage: 1.8867924528301887,
            epmAverage: 158.78129602356407,
            level: 5
        )
    )
    static var SamplePracticeModelID = {
        SamplePracticeModel.persistentModelID
    }
}
// swiftlint: enable type_body_length line_length
