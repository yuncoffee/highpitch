//
//  VideoControllerContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI

struct VideoControllerContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
    private let INDICATOR_HEIGHT = 32.0
    
    var body: some View {
        VStack(spacing: .zero) {
            viewStore.currentFeedbackViewType.audioIndicator
                .frame(maxWidth:.infinity, maxHeight: 32)
                .background(Color.yellow)
            HStack {
                Text("AudioController")
            }
            .frame(maxWidth:.infinity, maxHeight: 64)
            .background(Color.red)
        }
    }
}

#Preview {
    VideoControllerContainer()
}
