//
//  VideoContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI
import SwiftData

import NaturalLanguage

struct VideoContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
//    @Query(sort: \PracticeModel.creatAt)
//    var practices: [PracticeModel]
    
    var body: some View {
        VStack {
            VStack {
                header
//                Text("연습날짜")
//                Text("연습 타이틀")
//                HStack {
//                    Text("목표시간")
//                    Text("초과시간")
//                }
            }
            VStack {
                Text("Video Active")
                    .onTapGesture {
                        withAnimation {
//                            viewStore.isFullScreenVideoVisible = true
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .background(Color.gray)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange)
    }
}

extension VideoContainer {
    @ViewBuilder
    private var header: some View {
        VStack(spacing: 0) {
            Text("NAME")
//            Text("\(viewStore.practice.creatAt)")
//                .systemFont(.body)
//            Text("\(viewStore.practice.practiceName) 번째 연습")
        }
    }
}

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    
    return VideoContainer()
//        .modelContainer(modelContainer)
//        .environment(
//            PracticeViewStore(practice: practices[0], mediaManager: MediaManager())
//        )
//        .environment(
//            PracticeViewStore(
//                practice: practice,
//                mediaManager: MediaManager()
//            )
//        )
}
