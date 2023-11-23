//
//  SpeechTestButtonGroup.swift
//  highpitch
//
//  Created by yuncoffee on 11/22/23.
//

import SwiftUI

struct SpeechTestButtonGroup: View {
    @Environment(OnboardingViewStore.self)
    var store
    @Environment(MediaManager.self)
    var mediaManager
    let fileName: String
    var index: Int = 0
    @Binding var status: MySPMTestType
    
    @State
    private var isAudioRecord = false
    @State
    private var isAudioPlay = false
    @State
    private var animationsRunning = false
    @State
    private var isSheetActive = false
    @State
    private var duration = 0.0

    var body: some View {
        switch status {
        case .testBefore:
            testBeforeButtonGroup
        case .testing:
            testingButtonGroup
        case .testAfter:
            testAfterButtonGroup
        }
    }
}

extension SpeechTestButtonGroup {
    private func testBeforeButtonAction() {
        if mediaManager.checkMicrophonePermission() {
            status = .testing
            recording()
        } else {
            isSheetActive = true
        }
    }
    private func recording() {
        mediaManager.prepareOnboardingRecording(fileName: fileName)
        mediaManager.fileName = fileName
        mediaManager.audioRecorder?.record()
    }
    private func finishRecording() {
        mediaManager.audioRecorder?.stop()
        status = .testAfter
        store.isFinishs[index] = true
    }
    private func replay() {
        let url = URL(fileURLWithPath: URL.getPath(fileName: fileName, type: .onboarding).path())
        isAudioPlay = true
        do {
            try mediaManager.registerAudio(url: url)
        } catch {
            print(error)
        }
        duration = mediaManager.getDuration()
        mediaManager.play()
        
    }
    private func reRecord() {
        status = .testing
        mediaManager.stopPlaying()
        recording()
    }
    private func anlaysisAudio(result: [UtteranceModel]) {
        var syllableSum = 0
        var durationSum = 0
        
        result.forEach { utterance in
            for word in utterance.message.components(separatedBy: " ") {
                syllableSum += word.count
                if word.last! == "." {
                    syllableSum -= 1
                }
            }
            durationSum += utterance.duration
        }
        let spmResult = (Double(syllableSum * 60000) / Double(durationSum))
        if index == 0 {
            SystemManager.shared.test1SPM = spmResult
        } else {
            SystemManager.shared.test2SPM = spmResult
        }
        SystemManager.shared.instantFeedbackManager.speechRecognizerManager = nil
    }
}

extension SpeechTestButtonGroup {
    @ViewBuilder
    var testBeforeButtonGroup: some View {
        HPButton(type: .blockFill(.HPCornerRadius.medium), size: .large, color: .HPPrimary.base) {
            testBeforeButtonAction()
        } label: { type, size, color, expandable in
            HPLabel(
                content: ("해당 문장 읽기", nil),
                type: type,
                size: size,
                color: color,
                expandable: expandable
            )
        }
        .frame(maxWidth: 178)
        .padding(.bottom, .HPSpacing.small)
        .sheet(isPresented: $isSheetActive) {
            RequestMicPermissionSheet(isActive: $isSheetActive)
        }
    }
    
    @ViewBuilder
    var testingButtonGroup: some View {
        VStack {
            HStack {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24)
                    .foregroundStyle(Color.HPPrimary.base)
                    .symbolEffect(.variableColor.iterative, options: .repeating, value: animationsRunning)
            }
            .frame(maxWidth: 178, maxHeight: 40)
            .background(Color.HPGray.system200)
            .clipShape(RoundedRectangle(cornerRadius: .HPCornerRadius.medium))
            HPButton(type: .text, size: .small, color: .HPPrimary.dark) {
                finishRecording()
            } label: { type, size, color, expandable in
                HPLabel(
                    content: ("다 읽었어요", "arrow.clockwise"),
                    type: type,
                    size: size,
                    color: color,
                    alignStyle: .iconWithText,
                    expandable: expandable,
                    fontStyle: .systemDetail(.caption, .semibold)
                )
            }
            .frame(maxWidth: 178)
            .background(
                Rectangle()
                    .fill(Color.HPPrimary.base)
                    .frame(width: 64, height: 2)
                    .offset(x: 10, y: 10)
            )
        }
        .onAppear(perform: {
            animationsRunning = true
        })
        .onDisappear {
            withAnimation {
                animationsRunning = false
            }
        }
    }
    
    @ViewBuilder
    var testAfterButtonGroup: some View {
        VStack {
            HPButton(
                type: .blockFill(.HPCornerRadius.medium),
                size: .large,
                color: isAudioPlay ? .HPPrimary.lightnest : .HPPrimary.base) {
                    replay()
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: ("녹음 들어보기", nil),
                        type: type,
                        size: size,
                        color: color,
                        contentColor: isAudioPlay
                        ? .HPTextStyle.light
                        : .HPGray.systemWhite,
                        expandable: expandable
                    )
                }
                .frame(maxWidth: 178)
                .disabled(isAudioPlay)
            HPButton(type: .text, size: .small, color: .HPTextStyle.light) {
                reRecord()
            } label: { type, size, color, expandable in
                HPLabel(
                    content: ("다시 녹음할래요", "arrow.clockwise"),
                    type: type,
                    size: size,
                    color: color,
                    alignStyle: .iconWithText,
                    expandable: expandable,
                    fontStyle: .systemDetail(.caption, .semibold)
                )
            }
            .frame(maxWidth: 178)
            .background(
                Rectangle()
                    .fill(Color.HPTextStyle.light)
                    .frame(width: 90, height: 1)
                    .offset(x: 10, y: 10)
            )
        }
        .onAppear {
            mediaManager.audioRecorder = nil
            
        }
        .onChange(of: mediaManager.currentTime, { _, newValue in
            if newValue == 0.0 {
                isAudioPlay = false
            }
        })
        .task {
            SystemManager.shared.instantFeedbackManager.speechRecognizerManager = SpeechRecognizerManager()
            let url = URL(fileURLWithPath: URL.getPath(fileName: fileName, type: .onboarding).path())
            let result = await SystemManager.shared.instantFeedbackManager.speechRecognizerManager?.startFileRecognition(url: url)
            anlaysisAudio(result: result ?? [])
        }
        .onDisappear {
            isAudioPlay = false
        }
    }
}

enum MySPMTestType: Int {
    case testBefore
    case testing
    case testAfter
}

#Preview {
    @State var status: MySPMTestType = .testBefore
    @State var isFinish = false
    @State var mediaManager = MediaManager()
    return SpeechTestButtonGroup(fileName: "test", status: $status)
        .environment(mediaManager)
}
