//
//  SplitViewContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI

struct SplitViewContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
    var body: some View {
        HStack(spacing: .zero) {
            VideoContainer()
            PracticeDetailContainer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .zIndex(viewStore.isFullScreenVideoVisible ? 0 : 1)
    }
}

#Preview {
    SplitViewContainer()
}
