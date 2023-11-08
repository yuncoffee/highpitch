//
//  FeedbackChartView.swift
//  highpitch
//
//  Created by yuncoffee on 10/14/23.
//

import SwiftUI

struct FeedbackChartView: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    @State
    private var isFillerWordTooltipActive = false
    @State
    private var isSpeedTooltipActive = false
    
    var body: some View {
        VStack(spacing: 0) {
            header
            ScrollView {
                fillerWordChartContainer
                Divider()
                    .padding(.trailing, .HPSpacing.medium)
                speedChartContainer
            }
            .padding(.bottom, 100)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        }
        .padding(.leading, .HPSpacing.medium)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension FeedbackChartView {
    @ViewBuilder
    private var header: some View {
        VStack(spacing: 0) {
            Text("연습 요약보기")
                .systemFont(.largeTitle)
                .foregroundStyle(Color.HPTextStyle.darker)
        }
        .padding(.bottom, .HPSpacing.xsmall)
        .frame(maxWidth: 740, alignment: .leading)        
    }
    
    @ViewBuilder
    private var fillerWordChartContainer: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: .HPSpacing.xxxxsmall) {
                Text("이번 연습에서 사용한 습관어")
                    .systemFont(.title)
                    .foregroundStyle(Color.HPTextStyle.darker)
                tooltipFillerWord
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, .HPSpacing.xsmall)
            UsagePercentChart(practiceModel: viewStore.practice)
            UsageTopTierChart(
                fillerWordCount: viewStore.practice.summary.fillerWordCount,
                fillerWords: viewStore.getSortedFillerWord()
            )
            if viewStore.hasFillerWord() {
                FillerWordDetail(fillerWords: viewStore.getSortedFillerWord())
                    .padding(.bottom, .HPSpacing.medium)
            }
        }
        .frame(maxWidth: 720, maxHeight: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    private var speedChartContainer: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack(alignment: .top, spacing: .HPSpacing.xxxxsmall) {
                    Text("이번 연습에서의 말 빠르기")
                        .systemFont(.title)
                        .foregroundStyle(Color.HPTextStyle.darker)
                    tooltipSpeed
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .leading
                )
                SpeedAverageChart(
                    sentences: viewStore.getSortedSentences(),
                    practice: viewStore.practice,
                    epmRange: viewStore.getEpmRange()
                )
            }
            .padding(.top, .HPSpacing.medium)
            .frame(
                maxWidth: 720,
                maxHeight: .infinity,
                alignment: .leading
            )
            if !viewStore.isFastSentenceEmpty() {
                FastSentReplay()
            }
            if !viewStore.isSlowSentenceEmpty() {
                SlowSentReplay()
            }
        }
    }
    
    @ViewBuilder
    private var tooltipFillerWord: some View {
        HPButton(type: .text, size: .small, color: .HPGray.system400) {
            isFillerWordTooltipActive.toggle()
        } label: { type, size, color, expandable in
            HPLabel(
                content: (label: "도움말", icon: "questionmark.circle"),
                type: type, 
                size: size, color: color,
                alignStyle: .iconOnly,
                iconSize: 16,
                expandable: expandable
            )
        }
        .frame(width: 20, height: 20)
        .sheet(isPresented: $isFillerWordTooltipActive) {
            FillerWordSheet(isFillerWordTooltipActive: $isFillerWordTooltipActive)
        }
        .offset(y: -2)
    }
    
    @ViewBuilder
    private var tooltipSpeed: some View {
        Button {
            isSpeedTooltipActive.toggle()
        } label: {
            Label("도움말", systemImage: "questionmark.circle")
                .systemFont(.footnote)
                .labelStyle(.iconOnly)
                .foregroundStyle(Color.HPGray.system400)
                .frame(width: 20, height: 20)
        }.sheet(isPresented: $isSpeedTooltipActive) {
            EPMSheet(isSpeedTooltipActive: $isSpeedTooltipActive)
        }
        .buttonStyle(.plain)
        .offset(y: -2)
    }
}
//
// #Preview {
//    @State var practice = Practice(audioPath: Bundle.main.bundleURL, utterances: [])
//    return FeedbackChartView(practice: $practice)
// }
