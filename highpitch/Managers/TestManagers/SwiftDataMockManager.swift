//
//  SwiftDataMockManager.swift
//  highpitch
//
//  Created by yuncoffee on 11/9/23.
//

import Foundation
import SwiftData

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
            container.mainContext.insert(samplePractice)
            
//            sampleProject.
//            sampleProject.practices
            
//            for i in 1...9 {
//                let user = User(name: "Example User \(i)")
//                container.mainContext.insert(user)
//            }

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
        words: [WordModel]
        summary: PracticeSummaryModel(syllableSum: 0)
    )
}
