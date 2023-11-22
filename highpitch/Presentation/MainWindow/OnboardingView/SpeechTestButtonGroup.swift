//
//  SpeechTestButtonGroup.swift
//  highpitch
//
//  Created by yuncoffee on 11/22/23.
//

import SwiftUI

struct SpeechTestButtonGroup: View {
    @Environment(MediaManager.self)
    var mediaManager
    
    @Binding var status: MySPMTestType
    
    @State
    private var isAudioRecord = false
    @State
    private var isAudioPlay = false
    @State
    private var animationsRunning = false
    @State
    private var isSheetActive = false
    
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
        } else {
            isSheetActive = true
        }
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
                status = .testAfter
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
        .onAppear {
            withAnimation {
                animationsRunning = true
            }
        }
        .onDisappear {
            animationsRunning = false
        }
    }
    
    @ViewBuilder
    var testAfterButtonGroup: some View {
        VStack {
            HPButton(
                type: .blockFill(.HPCornerRadius.medium),
                size: .large,
                color: isAudioPlay ? .HPPrimary.lightnest : .HPPrimary.base) {
                isAudioPlay = true
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
                status = .testing
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
    @State var mediaManager = MediaManager()
    return SpeechTestButtonGroup(status: $status).environment(mediaManager)
}
