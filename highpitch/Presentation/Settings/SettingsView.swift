//
//  SettingsView.swift
//  highpitch
//
//  Created by yuncoffee on 10/10/23.
//

/**
 사용자화 기능 필요
 */
import AppKit
import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(MediaManager.self)
    private var mediaStore
    @State private var selectedTab = 0
    @State private var isAlertActive = false
    @State
    private var store = OnboardingViewStore()
    @State
    private var systemManager: SystemManager = SystemManager.shared
    
    var body: some View {
        VStack(spacing: .zero) {
            VStack(spacing: .HPSpacing.xxsmall) {
                Text("정확한 분석을 위해 내 평균 말하기 속도를 측정해주세요")
                    .systemFont(.subTitle, weight: .bold)
                    .foregroundStyle(Color.HPTextStyle.darker)
                Text("실제 발표 상황이라고 생각한 후,\n제시된 스크립트를 편하게 읽어보세요!")
                    .systemFont(.footnote, weight: .medium)
                    .foregroundStyle(Color.HPTextStyle.base)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity, maxHeight: 148)
            .background(Color.HPGray.systemWhite)
            SpeechTestView(hasHeader: false)
                .environment(store)
                .offset(y: -32)
                .frame(
                    maxWidth:.infinity,
                    maxHeight: .infinity
                )
            HStack {
                HStack(spacing: .HPSpacing.xxsmall) {
                    HPButton(type: .text, color: .HPTextStyle.base) {
                        print("변경 전:", SystemManager.shared.spmAverage)
                        SystemManager.shared.spmAverage = 356.7
                        UserDefaults.standard.set(356.7, forKey: "spmAverage")
                        print("변경 후:", SystemManager.shared.spmAverage)
                    } label: { type, size, color, expandable in
                        HPLabel(
                            content: ("초기화 하기", nil),
                            type: type,
                            size: size,
                            color: color,
                            expandable: expandable
                        )
                    }
                    .frame(width: 90)
                    .fixedSize()
                    HPButton(color: .HPSecondary.base) {
                        print("변경 전:", SystemManager.shared.spmAverage)
                        SystemManager.shared.spmAverage =
                        SystemManager.shared.testSPMs[0] + SystemManager.shared.testSPMs[1] / 2.0
                        UserDefaults.standard.set(
                            (SystemManager.shared.testSPMs[0]
                            + SystemManager.shared.testSPMs[1]) / 2.0
                            , forKey: "spmAverage"
                        )
                        print("변경 후:", SystemManager.shared.spmAverage)
                    } label: { type, size, color, expandable in
                        HPLabel(
                            content: ("저장하기", nil),
                            type: type,
                            size: size,
                            color: color,
                            expandable: expandable
                        )
                    }
                    .disabled(!store.isTestFinish())
                    .frame(width: 90)
                    .fixedSize()
                }
                .padding(.bottom, .HPSpacing.medium)
                .padding(.trailing, .HPSpacing.medium)
                .frame(
                    maxWidth:.infinity,
                    maxHeight: 70,
                    alignment: .bottomTrailing
                )
            }
        }
        .frame(width: 636, height: 645)
        .background(Color.HPComponent.Onboarding.background)
        .navigationTitle("말 빠르기 설정")
//        TabView(selection: $selectedTab) {
//            // 첫 번째 탭
//            GeneralSettingView()
//                .tabItem {
//                    Image(systemName: "gearshape.fill")
//                    Text("General")
//                }
//                .tag(0)
//                
//            // 두 번째 탭
//            FeedbackSettingView()
//                .tabItem {
//                    Image(systemName: "pencil")
//                    Text("Feedback")
//                }
//                .tag(1)
//        }
//        .frame(minWidth: 508, idealWidth: 508, minHeight: 512, idealHeight: 512, alignment: .topLeading)
//        .background(Color.HPGray.systemWhite)
    }
}

#Preview {
    SettingsView()
        .environment(MediaManager())
}
