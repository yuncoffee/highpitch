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
    
    @State
    var isFullScreenVideoVisible = false {
        didSet {
            if isFullScreenVideoVisible {
                isFullScreenTransition = true
            }
        }
    }
    
    @State
    var isFullScreenTransition = false {
        didSet {
            if !isFullScreenVideoActive {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    isFullScreenVideoActive = true
                }
            }
        }
    }
    
    @State
    var isFullScreenVideoActive = true {
        didSet {
            if !isFullScreenVideoActive {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    isFullScreenVideoVisible = false
                }
            }
        }
    }
    
    @State
    var isFullScreenVideoHover = false
    
    private let PRACTICE_DETAIL_VIEW_WIDTH = 440.0
    private let INDICATOR_HEIGHT = 32.0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                fullScreenVideoContainer
                splitViewContainer
            }
            .padding(.bottom, .HPSpacing.xxxlarge)
            videoControllerContainer
        }
    }
}

extension PracticeContentContainer {
    @ViewBuilder
    private var fullScreenVideoContainer: some View {
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
                    y: isFullScreenTransition ? 0 : geometry.size.height / 2 - 150
                )
                VStack {
                    Text("Title")
                    Text("subTitle")
                }
                .frame(maxWidth: .infinity, maxHeight: 64, alignment: .topLeading)
                .background(Color.purple)
                .offset(y: isFullScreenTransition && isFullScreenVideoHover
                        ? .zero
                        : -64
                )
                /// footer
                HStack {
                    Text("토글")
                    Text("토글토글")
                    Text("토글토글토글")
                    Text("전체화면")
                        .onTapGesture {
                            withAnimation {
                                isFullScreenVideoActive = false
                                isFullScreenTransition = false
                            }
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: 56)
                .background(Color.blue)
                .offset(y: isFullScreenTransition && isFullScreenVideoHover
                        ? geometry.size.height - (56 + INDICATOR_HEIGHT)
                        : geometry.size.height - INDICATOR_HEIGHT
                )
                .onTapGesture {
                    print("HELL?O?")
                }
            }
            .frame(
                maxWidth: isFullScreenTransition ? .infinity : 480,
                maxHeight: isFullScreenTransition ? .infinity : 300
            )
            .onHover { hovering in
                withAnimation {
                    isFullScreenVideoHover = hovering
                }
            }
        })
        .zIndex(isFullScreenVideoVisible ? 1 : 0)
    }
    
    @ViewBuilder
    private var splitViewContainer: some View {
        HStack(spacing: .zero) {
            VStack {
                VStack {
                    Text("연습날짜")
                    Text("연습 타이틀")
                    HStack {
                        Text("목표시간")
                        Text("초과시간")
                    }
                }
                VStack {
                    Text("Video Active")
                        .onTapGesture {
                            withAnimation {
                                isFullScreenVideoVisible = true
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .background(Color.gray)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.orange)
            VStack {
                HStack {
                    HStack {
                        Text("전체보기")
                        Text("습관어")
                        Text("말 빠르기")
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .zIndex(isFullScreenVideoVisible ? 0 : 1)
    }
    
    @ViewBuilder
    private var videoControllerContainer: some View {
        VStack(spacing: .zero) {
            HStack {
                Text("Indicator")
            }
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
    PracticeContentContainer()
        .frame(width: 1000, height: 640)
        .environment(
            PracticeViewStore(
                practice: PracticeModel(
                    practiceName: "",
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
