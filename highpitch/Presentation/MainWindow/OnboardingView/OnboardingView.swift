//
//  OnboardingView.swift
//  highpitch
//
//  Created by yuncoffee on 11/20/23.
//

import SwiftUI

struct OnboardingView: View {
    @State
    private var processCount = 0
    let IMAGE_SIZE = (width: 636.0, height: 628.0)
    let LEFT_CONTAINER_WIDTH = 364.0

    var body: some View {
        HStack(spacing: .zero) {
            leftContainer
            rightContainer
                .frame(maxWidth: IMAGE_SIZE.width, maxHeight: .infinity, alignment: .bottom)
                .background(Color.HPPrimary.lightnest)
        }
        .toolbarBackground(.hidden)
        .ignoresSafeArea()
        .onAppear {
            SystemManager.shared.instantFeedbackManager.speechRecognizerManager = SpeechRecognizerManager()
        }
        .onDisappear {
            SystemManager.shared.instantFeedbackManager.speechRecognizerManager = nil
        }
    }
}

extension OnboardingView {
    private func goToPrev() {
        withAnimation {
            if processCount > 0 {
                processCount -= 1
            }
        }
    }
    
    private func goToNext() {
        withAnimation {
            if processCount < 5 {
                processCount += 1
            }
            if processCount == 5 {
                print("zzz")
//                Task {
//                    var syllableSum1 = 0
//                    var durationSum1 = 0
//                    let url1 = URL(fileURLWithPath: URL.getPath(fileName: SystemManager.shared.ONBOARDING_TESTONE_FILE_NAME, type: .onboarding).path())
//                    let result1 = await SystemManager.shared.instantFeedbackManager.speechRecognizerManager?.startFileRecognition(url: url1)
//                    result1?.forEach { utterance in
//                        for word in utterance.message.components(separatedBy: " ") {
//                            syllableSum1 += word.count
//                            if word.last! == "." {
//                                syllableSum1 -= 1
//                            }
//                        }
//                        print("***************")
//                        durationSum1 += utterance.duration
//                    }
//                    print("SPM!!: \(Double(syllableSum1 * 60000) / Double(durationSum1))")
//                }
//                Task {
//                    let url2 = URL(fileURLWithPath: URL.getPath(fileName: SystemManager.shared.ONBOARDING_TESTTWO_FILE_NAME, type: .onboarding).path())
//                    let result2 = await SystemManager.shared.instantFeedbackManager.speechRecognizerManager?.startFileRecognition(url: url2)
//                    print("result2: ", result2?.count)
//                }
//                Task {
//                    print("!!!!!!!!!")
//                    var syllableSum1 = 0
//                    var durationSum1 = 0
//                    var syllableSum2 = 0
//                    var durationSum2 = 0
//                    let url1 = URL(fileURLWithPath: URL.getPath(fileName: SystemManager.shared.ONBOARDING_TESTONE_FILE_NAME, type: .onboarding).path())
//                    let url2 = URL(fileURLWithPath: URL.getPath(fileName: SystemManager.shared.ONBOARDING_TESTTWO_FILE_NAME, type: .onboarding).path())
//
////                        result1?.forEach { utterance in
////                            for word in utterance.message.components(separatedBy: " ") {
////                                syllableSum1 += word.count
////                                if word.last! == "." {
////                                    syllableSum1 -= 1
////                                }
////                            }
////                            print("***************")
////                            durationSum1 += utterance.duration
////                        }
////                        result2?.forEach { utterance in
////                            for word in utterance.message.components(separatedBy: " ") {
////                                syllableSum2 += word.count
////                                if word.last! == "." {
////                                    syllableSum2 -= 1
////                                }
////                            }
////                            print("------------")
////                            durationSum2 += utterance.duration
////                        }
////                    }
////                    let spmAverage = (Double(syllableSum1 * 60000) / Double(durationSum1) + Double(syllableSum2 * 60000) / Double(durationSum2)) / 2.0
////                    SystemManager.shared.spmAverage = spmAverage
//                }
////                SystemManager.shared.isPassOnbarding = true
////                UserDefaults.standard.set(true, forKey: "isPassOnbarding")
            }
        }
    }
}

extension OnboardingView {
    @ViewBuilder
    var leftContainer: some View {
        VStack(alignment: .leading, spacing: .zero) {
            HStack {
                if processCount == OnboardingProcess.intro.rawValue {
                    Image(.appIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding(.bottom, .HPSpacing.xsmall)
                } else {
                    indicator
                        .padding(.bottom, .HPSpacing.medium)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading ,spacing: .HPSpacing.xsmall) {
                Text("\(OnboardingProcess.allCases[processCount].textContent.title)")
                    .systemFont(.largeTitle)
                    .foregroundStyle(Color.HPTextStyle.darker)
                    .fixedSize()
                Text("\(OnboardingProcess.allCases[processCount].textContent.subTitle)")
                    .systemFont(.footnote, weight: .medium)
                    .foregroundStyle(Color.HPTextStyle.base)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            VStack(alignment: .leading, spacing: .HPSpacing.xxsmall) {
                HStack {
                    prevButton
                    nextButton
                }
                skipButton
            }
            .padding(.bottom, .HPSpacing.large)
            .frame(alignment: .leading)
        }
        .padding(.top, .HPSpacing.xxxlarge)
        .padding(.horizontal, .HPSpacing.xxlarge)
        .frame(minWidth: LEFT_CONTAINER_WIDTH, maxWidth: LEFT_CONTAINER_WIDTH, maxHeight:.infinity, alignment: .topLeading)
        .background(Color.HPGray.systemWhite)
        .zIndex(10.0)
    }
    
    @ViewBuilder
    var rightContainer: some View {
        HStack(spacing: .zero) {
            ForEach(OnboardingProcess.allCases, id: \.self) { process in
                process.imageView
                .frame(width: IMAGE_SIZE.width, height: IMAGE_SIZE.height)
            }
        }
        .frame(width: IMAGE_SIZE.width, height: IMAGE_SIZE.height, alignment: .leading)
        .background(Color.HPPrimary.lightnest)
        .offset(x: processCount == 0 ? 0.0 : -(Double(processCount) * IMAGE_SIZE.width))
        .clipped()
    }
    
    @ViewBuilder
    var indicator: some View {
        HStack(spacing: .HPSpacing.xxsmall) {
            Text("\(processCount)/\(OnboardingProcess.allCases.count - 1)")
                .systemFont(.caption)
                .foregroundColor(Color.HPTextStyle.base)
            HStack(spacing: .HPSpacing.xxxxsmall) {
                ForEach(Array(0...4), id: \.hashValue) { index in
                    RoundedRectangle(cornerRadius: .HPCornerRadius.small)
                        .fill(index >= processCount ? Color.HPGray.system200 : Color.HPPrimary.base)
                        .frame(maxWidth: 28, maxHeight: 8)
                }
            }
        }
    }
    
    @ViewBuilder
    var prevButton: some View {
        Button {
            goToPrev()
        } label: {
            Text("이전")
                .systemFont(.footnote, weight: .medium)
                .foregroundStyle(Color.HPTextStyle.dark)
                .padding(.vertical, .HPSpacing.xxxsmall)
                .padding(.horizontal, .HPSpacing.xsmall)
                .frame(maxWidth: 60, maxHeight: 40)
                .background(
                    RoundedRectangle(cornerRadius: .HPSpacing.xxxsmall)
                        .fill(Color.HPGray.system200)
                        .stroke(Color.HPComponent.stroke)
                )
                .clipShape(RoundedRectangle(cornerRadius: .HPSpacing.xxxsmall))
                
        }
        .buttonStyle(.plain)
        .contentShape(Rectangle())
    }
    
    @ViewBuilder
    var nextButton: some View {
        HPButton(type: .blockFill(.HPCornerRadius.medium), size: .large) {
            goToNext()
        } label: { type, size, color, expandable in
            HPLabel(
                content: (processCount == 5 ? "하이피치 시작하기" : "다음", nil),
                type: type,
                size: size,
                color: color,
                expandable: expandable
            )
        }
        .frame(maxWidth: 128)
    }
    
    @ViewBuilder
    var skipButton: some View {
        HPButton(type: .text, size: .small, color: .HPTextStyle.base) {
            SystemManager.shared.isPassOnbarding = true
        } label: { type, size, color, expandable in
            HPLabel(
                content: ("건너뛰기", "chevron.right"),
                type: type,
                size: size,
                color: color, alignStyle: .textWithIcon,
                expandable: expandable,
                fontStyle: .systemDetail(.caption, .semibold)
            )
        }
        .fixedSize()
    }
}

enum OnboardingProcess: Int, CaseIterable {
    case intro
    case menubar
    case feedback
    case practice
    case speechTest
    case outtro
    
    var textContent: (title: String, subTitle: String) {
        switch self {
        case .intro:
            ("하이피치와 함께\n스피치 실력을 올려보세요", "하이피치의 객관적인 분석 피드백을 통해\n발표 전달력 향상을 도와줄게요")
        case .menubar:
            ("메뉴바에서 바로 연습을\n시작할 수 있어요", "앱 내에서도 연습시작이 가능하지만,\n메뉴바에서 간편하게 연습을 시작한다면\n불필요한 시간을 줄일 수 있을거에요.")
        case .feedback:
            ("연습 중, 원하는 피드백을\n실시간으로 받을 수 있어요", "하이피치가 내 음성기록을 실시간으로\n들으며 연습을 보조해줄 거에요.")
        case .practice:
            ("연습 후, 내 스피치의\n개선점을 상세 체크해봐요", "내 연습 기록을 텍스트로 변환해\n체크할 부분을 하나하나 짚어줘요")
        case .speechTest:
            ("정확한 분석을 위해\n내 평균 말하기 속도를\n측정해야 해요", "하이피치가 내 연습을 원활히 분석할 수\n있도록 나만의 적절한 말하기 속도를\n알려주세요")
        case .outtro:
            ("이제 모든 준비가 끝났어요!", "하이피치와 함께 본격적으로\n스피치 연습을 시작하러 가볼까요?")
        }
    }
    
    @ViewBuilder
    var imageView: some View {
        switch self {
        case .intro:
            Image(.onboarding1)
            .resizable()
            .scaledToFit()
        case .menubar:
            Image(.onboarding2)
            .resizable()
            .scaledToFit()
        case .feedback:
            Image(.onboarding3)
            .resizable()
            .scaledToFit()
        case .practice:
            Image(.onboarding4)
            .resizable()
            .scaledToFit()
        case .speechTest:
            SpeechTestView()
        case .outtro:
            Image(.onboarding6)
            .resizable()
            .scaledToFit()
        }
    }
}

#Preview {
    OnboardingView()
}
