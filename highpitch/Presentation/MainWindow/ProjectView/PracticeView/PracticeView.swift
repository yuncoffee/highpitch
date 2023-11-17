//
//  PracticeView.swift
//  highpitch
//
//  Created by yuncoffee on 10/13/23.
//

import SwiftUI
import AVKit

struct PracticeView: View {
    @State
    var viewStore: PracticeViewStore
    
    var title = ""
    private var subTitle = ""
    
    init(viewStore: PracticeViewStore, title: String?) {
        self.viewStore = viewStore
        self.title = title ?? ""
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HPTopToolbar(
                title: title,
                completion: nil
            )
            PracticeContentContainer()
                .clipped()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.HPGray.systemWhite)
        .ignoresSafeArea()
        .onAppear {
            viewStore.setupPracticeView()
        }
        .environment(viewStore)
    }
}

extension PracticeView {
    @ViewBuilder
    private var practiceContentsContainer: some View {
        HStack(spacing: 0) {
            /// 피드백 뷰
            FeedbackChartView()
        }
        .padding(.top, .HPSpacing.small)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
