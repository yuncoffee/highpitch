//
//  ScreenSelectionView.swift
//  highpitch
//
//  Created by musung on 11/14/23.
//

import SwiftUI

struct ScreenSelectionView: View {
    @State var currentTabItem = 0
    @State var isChecked = false
    @StateObject var screenRecorder = ScreenRecordManager()
    //
    @State var disableInput = false
    @State var isUnauthorized = false
    //
    var body: some View {
        VStack {
            Text("화면 녹화")
            Text("녹화할 화면을 선택하고 연습을 시작해 주세요")
            tabBar
            tabBarContentContainer
            HStack {
                Toggle(isOn: $isChecked) {
                    Text("화면 녹화 없이 연습하기")
                }
                Button(action: {
                    Task {
                        await screenRecorder.stopPreview()
                        await screenRecorder.stop()
                    }

                }, label: {
                    Text("취소")
                })
                Button(action: {
                    print("hello")
                    Task {
                        await screenRecorder.stopPreview()
                        await screenRecorder.start()
                    }
                }, label: {
                    Text("연습 시작")
                })
            }
            
        }.onAppear {
            Task {
                if await screenRecorder.canRecord {
                    await screenRecorder.startPreview()
                } else {
                    isUnauthorized = true
                    disableInput = true
                }
            }
        }
    }
}
// MARK: - Views
extension ScreenSelectionView {
    
    // MARK: - tabBar
    @ViewBuilder
    private var tabBar: some View {
        let labels = ["애플리케이션", "화면"]
        HStack(spacing: .HPSpacing.small) {
            ForEach(Array(labels.enumerated()), id: \.1.self) { index, label in
                Button {
                    currentTabItem = index
                    screenRecorder.captureType = index == 0 ? .window : .display
                } label: {
                    let selected = currentTabItem == index
                    let labelForgroundColor: Color = if selected {
                        .HPTextStyle.darkness } else { .HPTextStyle.base }
                    let decorationColor: Color = if selected { .HPSecondary.base } else { .clear }
                    Text(label)
                        .systemFont(.body)
                        .foregroundStyle(labelForgroundColor)
                        .padding(.top, .HPSpacing.small)
                        .padding(.bottom, .HPSpacing.xxxsmall)
                        .padding(.horizontal, .HPSpacing.xxxsmall)
                        .frame(maxHeight: .infinity)
                        .border(
                            decorationColor,
                            width: 3,
                            edges: [.bottom]
                        )
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, .HPSpacing.xxxlarge)
        .frame(maxWidth: .infinity , minHeight: 60, maxHeight: 60, alignment: .bottomLeading)
        .background(Color.HPGray.systemWhite)
//        .border(Color.HPPrimary.light.opacity(0.25), width: 1, edges: [.bottom])
    }
    
    @ViewBuilder
    private var tabBarContentContainer: some View {
        VStack {
            if currentTabItem == 0 {
                // 컨텐츠 1 - 전체 연습통계
                ScreenItemView(screenRecorder: screenRecorder,index: 0)
            } else {
                // 컨텐츠 2 - 연습 회차별 피드백
                ScreenItemView(screenRecorder: screenRecorder,index: 1)
            }
        }
        .padding(.top, .HPSpacing.small + .HPSpacing.xxxxsmall)
        .padding(.horizontal, currentTabItem == 0 ? .HPSpacing.xxxlarge : 0)
        .padding(.bottom, .HPSpacing.large)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}
#Preview {
    ScreenSelectionView()
}
