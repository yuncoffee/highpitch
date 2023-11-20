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
            PracticeViewTopToolbar(title: title)
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
        .navigationBarBackButtonHidden()
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

struct PracticeViewTopToolbar: View {
    @Environment(\.dismiss)
    var dismiss
    var title: String = ""
    
    var body: some View {
        HPTopToolbar(
            title: title,
            backButtonCompletion: {
                dismiss()
            },
            completion: nil
        )
    }
}
