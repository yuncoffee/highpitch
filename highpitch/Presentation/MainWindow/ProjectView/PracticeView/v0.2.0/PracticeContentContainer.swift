//
//  PracticeContentContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI

struct PracticeContentContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                FullScreenVideoContainer()
                SplitViewContainer()
            }
            .padding(.bottom, .HPSpacing.xxxlarge)
            VideoControllerContainer()
        }
    }
}

#Preview {
    PracticeContentContainer()
        .frame(width: 1000, height: 640)
        .environment(
            PracticeViewStore(
                practice: PracticeModel(
                    practiceName: "Name",
                    index: 0,
                    isVisited: false,
                    creatAt: "",
                    utterances: [],
                    summary: PracticeSummaryModel()
                ),
                mediaManager: MediaManager()
            )
        )
}
