//
//  ReportSpeakingRateChart.swift
//  highpitch
//
//  Created by 이용준의 Macbook on 11/21/23.
//

import SwiftUI
import Charts

struct ReportSpeakingRateChart: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            ZStack(alignment: .trailing) {
                VStack(alignment:.trailing) {
                    HStack(spacing: .HPSpacing.xxxsmall) {
                        Circle()
                            .frame(width: 12, height: 12)
                            .foregroundStyle(Color.HPComponent.highlight)
                        Text("평균속도보다 빠른/느린 구간")
                            .systemFont(.caption2, weight: .medium)
                            .foregroundColor(Color.HPTextStyle.base)
                    }
                    Spacer()
                    Text("\(Date().secondToMS(Int(viewStore.practice.summary.practiceLength)))")
                        .systemFont(.caption2, weight: .medium)
                        .foregroundStyle(Color.HPTextStyle.base)
                        .offset(y: -30)
                }
                Chart {
                    /// 빠른/느린 구간 인디케이터
                    RectangleMark(
                        xStart: .value("", 0.0),
                        xEnd: .value("", viewStore.practice.summary.practiceLength),
                        yStart: .value("", viewStore.practice.summary.minSpm),
                        yEnd: .value(
                            "",
                            max(
                                viewStore.practice.summary.minSpm,
                                viewStore.practice.summary.spmAverage - 100.0
                        ))
                    )
                    .foregroundStyle(Color.HPComponent.highlight)
                    RectangleMark(
                        xStart: .value("", 0.0),
                        xEnd: .value("", viewStore.practice.summary.practiceLength),
                        yStart: .value("", min(viewStore.practice.summary.maxSpm,
                                               viewStore.practice.summary.spmAverage + 100.0)),
                        yEnd: .value("", viewStore.practice.summary.maxSpm)
                    )
                    .foregroundStyle(Color.HPComponent.highlight)
                    /// LineChart
                    ForEach(viewStore.getSentenceSpeakingRateData(), id:\.0) { sentence in
                        LineMark(
                            x: .value("시간", sentence.0),
                            y: .value("SPM", sentence.1)
                        )
                        .foregroundStyle(Color.HPPrimary.base)
                        .lineStyle(StrokeStyle(lineWidth: 2))
                    }
                }
                .chartXAxisLabel(alignment: .trailing) {
                    Text("(소요 시간)")
                        .systemFont(.caption2, weight: .medium)
                        .foregroundStyle(Color.HPTextStyle.light)
                        .offset(y: -10)
                }
                .chartYAxisLabel(alignment: .topLeading) {
                    Text("(속도: SPM)")
                        .systemFont(.caption2, weight: .medium)
                        .foregroundStyle(Color.HPTextStyle.light)
                }
                .chartPlotStyle { plotArea in
                    plotArea
                        .border(Color.HPComponent.stroke)
                    
                }
                .chartXAxis {
                    /// x축은 5개의 값이 나타나도록
                    /// 최저 값과 최고 값 차이의 1/4 간격으로 설정합니다.
                    AxisMarks(values: Array(stride(
                        from: 0.0,
                        through: viewStore.practice.summary.practiceLength,
                        by: viewStore.practice.summary.practiceLength / 4.0
                    ))) { value in
                        AxisValueLabel(centered: false) {
                            let axisValue = Double(value.index)
                                * viewStore.practice.summary.practiceLength / 4.0
                            let offsetValue = Double(-8 * value.index)
                            Text("\(Date().secondToMS(Int(axisValue)))")
                                .systemFont(.caption2, weight: .medium)
                                .foregroundStyle(Color.HPTextStyle.base)
                                .offset(x: offsetValue)
                        }
                    }
                }
                /// y축 값
                .chartYAxis {
                    /// y축은 5개의 값이 나타나도록
                    /// 최저 값과 최고 값 차이의 1/4 간격으로 설정합니다.
                    AxisMarks(position: .leading, values: 
                                viewStore.practice.summary.maxSpm == viewStore.practice.summary.minSpm
                              ? Array(stride(
                                from: viewStore.practice.summary.minSpm - 50.0,
                                through: viewStore.practice.summary.maxSpm + 50.0,
                                by: 100.0 / 4
                            ))
                              : Array(stride(
                                from: viewStore.practice.summary.minSpm,
                                through: viewStore.practice.summary.maxSpm,
                                by: (viewStore.practice.summary.maxSpm
                                     - viewStore.practice.summary.minSpm) / 4
                    ))) { value in
                        AxisValueLabel(centered: false) {
                            if value.index % 2 == 0 {
                                let axisValue = Double(value.index)
                                    * (viewStore.practice.summary.maxSpm
                                       - viewStore.practice.summary.minSpm) / 4
                                    + viewStore.practice.summary.minSpm
                                Text("\(axisValue, specifier: "%.1f")")
                                .systemFont(.caption)
                                .foregroundStyle(Color.HPTextStyle.base)
                            }
                        }
                        AxisGridLine()
                    }
                }
                .chartLegend(.hidden)
                .chartXScale(domain: [0.0, viewStore.practice.summary.practiceLength])
                .chartYScale(domain: [
                    viewStore.practice.summary.minSpm,
                    viewStore.practice.summary.maxSpm
                ])
                .frame(maxWidth: .infinity, minHeight: 230, maxHeight: 230)
            }
            VStack(alignment:.leading, spacing: 0) {
                Text("* SPM(Syllable Per Minutes ∙ 분당 음절수):\n1분 동안 얼마나 많은 음절을 말했는지를 기준으로 측정한 단위")
                    .systemFont(.caption2, weight: .medium)
                    .foregroundColor(Color.HPTextStyle.base)
                    .offset(x: 40, y: -10)
            }
        }
    }
}
