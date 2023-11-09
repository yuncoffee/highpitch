//
//  PracticeDetailContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI

struct PracticeDetailContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
    private let PRACTICE_DETAIL_VIEW_WIDTH = 440.0
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text("전체보기")
                        .onTapGesture {
                            viewStore.currentFeedbackViewType = .every
                        }
                    Text("습관어")
                        .onTapGesture {
                            viewStore.currentFeedbackViewType = .fillerWord
                        }
                    Text("말 빠르기")
                        .onTapGesture {
                            viewStore.currentFeedbackViewType = .speed
                        }
                }
                Text("리포트 보기")
            }
            /// 차트 컨테이너
            VStack {
                
            }
            /// 스크립트 컨테이너
            VStack {
                
            }
        }
        .frame(
            minWidth: PRACTICE_DETAIL_VIEW_WIDTH,
            maxWidth: PRACTICE_DETAIL_VIEW_WIDTH,
            maxHeight: .infinity
        )
        .background(Color.green)
    }
}

#Preview {
    PracticeDetailContainer()
}
