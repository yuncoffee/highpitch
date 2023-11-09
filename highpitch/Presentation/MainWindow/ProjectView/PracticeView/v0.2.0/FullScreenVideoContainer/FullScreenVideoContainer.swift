//
//  FullScreenVideoContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI

struct FullScreenVideoContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
    @State
    private var isFullScreenVideoHover = false
    
    private let INDICATOR_HEIGHT = 32.0
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack(alignment: .topLeading) {
                /// video
                VStack {
                    Text("Video")
                        .frame(maxWidth: geometry.size.width, maxHeight: .infinity)
                        .background(Color.brown)
                }
                .offset(
                    x: 0,
                    y: viewStore.isFullScreenTransition ? 0 : geometry.size.height / 2 - 150
                )
                VStack {
                    Text("Title")
                    Text("subTitle")
                }
                .frame(maxWidth: .infinity, maxHeight: 64, alignment: .topLeading)
                .background(Color.purple)
                .offset(y: viewStore.isFullScreenTransition && isFullScreenVideoHover
                        ? .zero
                        : -64
                )
                .opacity(viewStore.isFullScreenTransition ? 1 : 0)
                /// footer
                HStack {
                    Text("토글")
                    Text("토글토글")
                    Text("토글토글토글")
                    Text("전체화면")
                        .onTapGesture {
                            withAnimation {
                                viewStore.isFullScreenVideoActive = false
                            }
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: 56)
                .background(Color.blue)
                .offset(y: viewStore.isFullScreenTransition && isFullScreenVideoHover
                        ? geometry.size.height - (56 + INDICATOR_HEIGHT)
                        : geometry.size.height - INDICATOR_HEIGHT
                )
                .opacity(viewStore.isFullScreenTransition ? 1 : 0)
                .onTapGesture {
                    print("HELL?O?")
                }
            }
            .frame(
                maxWidth: viewStore.isFullScreenTransition ? .infinity : 480,
                maxHeight: viewStore.isFullScreenTransition ? .infinity : 300
            )
            .onHover { hovering in
                withAnimation {
                    isFullScreenVideoHover = hovering
                }
            }
        })
        .zIndex(viewStore.isFullScreenVideoVisible ? 1 : 0)
    }
}

#Preview {
    FullScreenVideoContainer()
}
