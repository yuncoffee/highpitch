//
//  ReportView.swift
//  highpitch
//
//  Created by 이용준의 Macbook on 11/21/23.
//

import SwiftUI

struct ReportView: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
    var eachFillerWordCount: [FillerWordModel] {
        viewStore.getSortedFillerWord()
    }
        
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                content
                    .padding(.horizontal, 64)
                    .frame(maxWidth: .infinity)
            }
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 14, height: 14)
                .foregroundStyle(Color.HPGray.system600)
                .padding(.top, .HPSpacing.xsmallBetweenSmall)
                .padding(.trailing, .HPSpacing.xsmallBetweenSmall + 4)
        }
        .background(Color.HPComponent.Section.background)
        .frame(
            width: 778,
            height: viewStore.screenSize.height - 48
        )
    }
}

extension ReportView {
    @ViewBuilder
    var content: some View {
        VStack(spacing: .zero) {
            header
            Rectangle()
                .frame(maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                .foregroundColor(Color.HPComponent.stroke)
                .padding(.bottom, .HPSpacing.xsmallBetweenSmall)
            VStack(spacing: .zero) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("나의 평균 데이터 요약")
                        .systemFont(.title)
                        .foregroundColor(Color.HPTextStyle.darker)
                        .padding(.bottom, .HPSpacing.small)
                    averageData
                        .padding(.bottom, .HPSpacing.xlarge)
                    Text("습관어 분석")
                        .systemFont(.title)
                        .foregroundColor(Color.HPTextStyle.darker)
                        .padding(.bottom, .HPSpacing.xxxsmall)
                    HStack(spacing: 0) {
                        Text("이번 연습에서 분당 습관어 사용은 ")
                            .systemFont(.footnote, weight: .semibold)
                            .foregroundColor(Color.HPTextStyle.dark)
                        Text("\(viewStore.practice.summary.fwpm, specifier: "%.1f")회")
                            .systemFont(.footnote, weight: .bold)
                            .foregroundColor(Color.HPPrimary.dark)
                        Text("로 ")
                            .systemFont(.footnote, weight: .semibold)
                            .foregroundColor(Color.HPTextStyle.dark)
                        Text(
                            viewStore.practice.summary.fwpm >= 5.0
                            ? "많았어요."
                            : viewStore.practice.summary.fwpm >= 3.0
                            ? "조금 많았어요."
                            : viewStore.practice.summary.fwpm > 0.0
                            ? "적절했어요." : "없었어요."
                        )
                        .systemFont(.footnote, weight: .bold)
                        .foregroundColor(Color.HPPrimary.dark)
                    }
                    /// 사용한 습관어가 있다면 문장을 제시합니다.
                    if viewStore.practice.summary.fwpm >= 3.0 {
                        HStack(spacing: 0) {
                            ForEach(0..<3) { index in
                                if eachFillerWordCount[index].count > 0 {
                                    Text("\"\(eachFillerWordCount[index].fillerWord)\"")
                                        .systemFont(.footnote, weight: .bold)
                                        .foregroundColor(Color.HPPrimary.dark)
                                    if index < 2 && eachFillerWordCount[index + 1].count > 0 {
                                        Text(", ")
                                            .systemFont(.footnote, weight: .bold)
                                            .foregroundColor(Color.HPPrimary.dark)
                                    }
                                }
                            }
                            Text(" 을(를) ")
                                .systemFont(.footnote, weight: .semibold)
                                .foregroundColor(Color.HPTextStyle.dark)
                            Text(
                                viewStore.practice.summary.fwpm >= 5.0
                                ? "줄여보는건 어떨까요?"
                                :  "조금 더 신경써보면 좋을거에요."
                            )
                            .systemFont(.footnote, weight: .semibold)
                            .foregroundColor(Color.HPTextStyle.dark)
                        }
                    } else {
                        Text(
                            viewStore.practice.summary.fwpm >= 1.0
                            ? "이 정도면 괜찮아요!"
                            :  "이 페이스를 유지해보아요!"
                        )
                        .systemFont(.footnote, weight: .semibold)
                        .foregroundColor(Color.HPTextStyle.dark)
                    }
                }
                .padding(.bottom, .HPSpacing.large)
                Text("습관어 종류 및 횟수")
                    .systemFont(.caption, weight: .semibold)
                    .foregroundColor(Color.HPPrimary.dark)
                    .frame(width: 131, height: 29)
                    .background(Color.HPPrimary.lightnest)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.bottom, .HPSpacing.xxxsmall)
                Text("이번 연습에서 자주 언급된 습관어에요.")
                    .systemFont(.caption, weight: .semibold)
                    .foregroundColor(Color.HPTextStyle.base)
                    .padding(.bottom, .HPSpacing.medium)
                
                HStack(spacing: viewStore.getFillerWordTypeCount() > 12
                       ? .HPSpacing.medium : .HPSpacing.xxlarge) {
                    ReportFillerWordChart(
                        fillerWordCount: viewStore.practice.summary.fillerWordCount,
                        fillerWords: viewStore.getSortedFillerWord()
                    )
                    .frame(width: 200, height: 200)
                    fillerWords
                }
                       .padding(.bottom, .HPSpacing.xxxlarge + .HPSpacing.xxxsmall)
                VStack(alignment: .leading, spacing: 0) {
                    Text("말 빠르기 분석")
                        .systemFont(.title, weight: .bold)
                        .foregroundColor(Color.HPTextStyle.darker)
                    HStack(spacing: 0) {
                        Group {
                            Text("최고 속도는 ")
                                .foregroundColor(Color.HPTextStyle.dark)
                            Text("\(Int(viewStore.practice.summary.maxSpm))SPM,")
                                .foregroundColor(Color("F8AE44"))
                            Text(" 최저 속도는 ")
                                .foregroundColor(Color.HPTextStyle.dark)
                            Text("\(Int(viewStore.practice.summary.minSpm))SPM")
                                .foregroundColor(Color("F8AE44"))
                            Text(" 이었어요.")
                                .foregroundColor(Color.HPTextStyle.dark)
                        }
                        .systemFont(.footnote, weight: .semibold)
                    }
                    HStack(spacing: 0) {
                        Group {
                            Text("\(viewStore.returnMostVarianceTime())")
                                .foregroundColor(Color("F8AE44"))
                            Text(" 구간에서 가장 큰 속도 변화가 있었어요.")
                                .foregroundColor(Color.HPTextStyle.dark)
                        }
                        .systemFont(.footnote, weight: .semibold)
                    }
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
                .padding(.bottom, .HPSpacing.large)
                Text("말 빠르기 변화")
                    .systemFont(.caption, weight: .semibold)
                    .foregroundColor(Color("DD8100"))
                    .frame(width: 104, height: 29)
                    .background(Color("FFF8F1"))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.bottom, .HPSpacing.xxxsmall)
                Text("이번 연습에서의 시간에 따른 말 빠르기 차트에요.")
                    .systemFont(.caption, weight: .semibold)
                    .foregroundColor(Color.HPTextStyle.base)
                    .padding(.bottom, .HPSpacing.medium)
                ReportSpeakingRateChart()
                    .padding(.horizontal, 65)
                    .padding(.bottom, 54)
                Rectangle()
                    .frame(maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                    .foregroundColor(Color.HPComponent.stroke)
                    .padding(.bottom, .HPSpacing.xsmallBetweenSmall)
                Image("hp-text-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110)
                    .padding(.bottom, .HPSpacing.xsmall + .HPSpacing.xxsmall)
            }
            .padding(.horizontal, 28)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
    
    @ViewBuilder
    var header: some View {
        VStack(alignment: .leading, spacing: .HPSpacing.xxxxsmall) {
            Text("\(viewStore.projectName)")
                .systemFont(.title, weight: .semibold)
                .foregroundColor(Color.HPTextStyle.darker)
            HStack(spacing: .zero) {
                Group {
                    Text("\(viewStore.practice.practiceName)")
                    Text(" | ")
                    Text("\(Date().createAtToYMD(input: viewStore.practice.creatAt))")
                    Text(" \(Date().createAtToHM(input: viewStore.practice.creatAt))")
                }
                .systemFont(.body, weight: .medium)
                .foregroundColor(Color.HPTextStyle.base)
            }
        }
        .padding(.leading, .HPSpacing.xxxxsmall)
        .padding(.top, .HPSpacing.xxsmall + .HPSpacing.xsmall)
        .padding(.bottom, .HPSpacing.xsmallBetweenSmall)
        .frame(
            maxWidth: .infinity,
            alignment: .topLeading
        )
    }
    
    @ViewBuilder
    var averageData: some View {
        HStack(spacing: 0) {
            VStack(spacing: 5) {
                Text("연습 소요시간")
                    .systemFont(.footnote, weight: .medium)
                    .foregroundColor(Color.HPTextStyle.darker)
                Text("\(Date().secondToKoreanMS(Int(viewStore.practice.summary.practiceLength)))")
                    .systemFont(.largeTitle, weight: .bold)
                    .foregroundColor(Color.HPPrimary.base)
            }
            .frame(maxWidth: .infinity, minHeight: 65, maxHeight: 65)
            VStack(spacing: 5) {
                Text("습관어 사용")
                    .systemFont(.footnote, weight: .medium)
                    .foregroundColor(Color.HPTextStyle.darker)
                HStack(alignment: .bottom, spacing: .HPSpacing.xxxxsmall) {
                    Text("분당")
                        .systemFont(.caption2, weight: .semibold)
                        .foregroundColor(Color.HPTextStyle.light)
                        .offset(y: -7)
                    Text("\(viewStore.practice.summary.fwpm, specifier: "%.1f")회")
                        .systemFont(.largeTitle, weight: .bold)
                        .foregroundColor(Color.HPPrimary.base)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 65, maxHeight: 65)
            .border(Color.HPComponent.stroke, width: 1, edges: [.leading, .trailing])
            VStack(spacing: 5) {
                Text("말 빠르기")
                    .systemFont(.footnote, weight: .medium)
                    .foregroundColor(Color.HPTextStyle.darker)
                Text("\(Int(viewStore.practice.summary.spmAverage))SPM")
                    .systemFont(.largeTitle, weight: .bold)
                    .foregroundColor(Color.HPPrimary.base)
            }
            .frame(maxWidth: .infinity, minHeight: 65, maxHeight: 65)
            
        }
        .frame(height: 108)
        .background(Color.HPComponent.Detail.background)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.HPComponent.Sidebar.background, lineWidth: 1)
        )
    }
    
    @ViewBuilder
    var fillerWords: some View {
        let data = viewStore.getFillerWordGridData()
        let columns = Array(repeating: GridItem(.fixed(32), spacing: 0), count: 6)
        
        LazyHGrid(rows: columns, spacing: 0) {
            ForEach(data, id: \.1) { word in
                HStack {
                    Text("\(word.0)")
                        .systemFont(.caption2, weight: .semibold)
                        .foregroundColor(Color.HPTextStyle.darker)
                        .padding(.leading,
                                 data.count == 6
                                 ? .HPSpacing.xxxsmall + .HPSpacing.xxsmall
                                 : .HPSpacing.xxsmall
                        )
                    Spacer()
                    if word.2 > 0 {
                        Text("\(word.2)회")
                            .systemFont(.caption2, weight: .semibold)
                            .foregroundColor(Color.HPPrimary.base)
                            .padding(.trailing,
                                     data.count == 6
                                     ? .HPSpacing.xxxsmall + .HPSpacing.xxsmall
                                     : .HPSpacing.xxsmall
                            )
                    }
                }
                .frame(width:
                        data.count == 18 ? 100 : data.count == 12 ? 112 : 198,
                       height: 32
                )
                .background(
                    ((word.1 - 1) / 6 + word.1) % 2 != 0
                    ? Color.HPComponent.Detail.background
                    : Color.HPGray.systemWhite
                )
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 9)
                .stroke(Color.HPComponent.stroke, lineWidth: 1)
        )
    }
}

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    return ReportView()
        .modelContainer(modelContainer)
        .environment(PracticeViewStore(
            projectName: "",
            practice: PracticeModel(
                practiceName: "",
                index: 0,
                isVisited: false,
                creatAt: "",
                utterances: [],
                summary: PracticeSummaryModel()
            ),
            mediaManager: MediaManager()))
}
