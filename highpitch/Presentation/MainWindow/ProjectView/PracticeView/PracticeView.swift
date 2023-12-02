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
        .overlay {
            GeometryReader { proxy in
                Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
            }
        }
        .onPreferenceChange(SizePreferenceKey.self) { value in
            viewStore.screenSize = value
        }
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
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
    // MARK: - 데이터 컨트롤을 위한 매니저 객체
    @Environment(MediaManager.self)
    private var mediaManager
    @Environment(ProjectManager.self)
    private var projectManager
    
    @Environment(\.dismiss)
    var dismiss
    var title: String = ""
    
    var body: some View {
        HPTopToolbar(
            title: title,
            backButtonCompletion: {
                var transaction = Transaction()
                transaction.disablesAnimations = true
                withTransaction(transaction) {
                    dismiss()
                }
            },
            completion: {
                if mediaManager.isRecording {
                    HPButton(type: .text, color: .HPSecondary.base) {
                        SystemManager.shared.isMainWindowPracticeSaveSheetActive = true
                    } label: { type, size, color, expandable in
                        HPLabel(
                            content: (label: "일시 정지", icon: "pause.fill"),
                            type: type,
                            size: size,
                            color: color,
                            alignStyle: .iconWithTextVertical,
                            expandable: expandable,
                            fontStyle: .system(.caption2)
                        )
                    }
                    .frame(width: 40)
                    .padding(.trailing, .HPSpacing.medium)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                } else {
                    HPButton(color: .HPSecondary.base) {
                        Task {
                            do {
                                if mediaManager.checkMicrophonePermission() {
                                    projectManager.isMicRecordpermitted = false
                                } else {
                                    projectManager.isMicRecordpermitted = true
                                    return
                                }
                                if await ScreenRecordManager.canRecord {
                                    projectManager.isScreenRecordpermitted = false
                                } else {
                                    projectManager.isScreenRecordpermitted = true
                                    return
                                }
                                let available = try await SpeechRecognizerManager().isSpeechAvailable()
                                if available {
                                    mediaManager.isDictationUnavailable = false
                                    mediaManager.isStart = true
                                } else {
                                    mediaManager.isDictationUnavailable = true
                                }
                            } catch { }
                        }
                    } label: { type, size, color, expandable in
                        HPLabel(
                            content: (label: "연습 시작하기", icon: nil),
                            type: type,
                            size: size,
                            color: color,
                            expandable: expandable,
                            fontStyle: .system(.footnote)
                        )
                    }
                    .frame(width: 120)
                    .padding(.trailing, .HPSpacing.medium)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        )
    }
}
