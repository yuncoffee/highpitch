//
//  AnalysisFWPMChart.swift
//  highpitch
//
//  Created by 이용준의 Macbook on 11/19/23.
//

import Charts
import SwiftData
import SwiftUI

struct AnalysisFWPMChart: View {
    
    @Query(sort: \PracticeModel.creatAt)
    let practices: [PracticeModel]
    @State
    var rawSelected: Int?
    
    var body: some View {
        VStack(alignment: .leading, spacing: .HPSpacing.xsmall) {
            Text("습관어 사용횟수")
                .systemFont(.subTitle)
                .foregroundStyle(Color.HPTextStyle.darker)
            ZStack(alignment: .topLeading) {
                Text("(분당 사용횟수)")
                    .systemFont(.caption2)
                    .foregroundStyle(Color.HPTextStyle.base)
                    .offset(y: -12)
                graph
                    .padding(.leading, .HPSpacing.xxsmall)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding(.top, .HPSpacing.small)
        .padding(.bottom, .HPSpacing.xxsmall)
        .padding(.horizontal, .HPSpacing.small)
        .frame(
            maxWidth: .infinity,
            minHeight: 286,
            maxHeight: 286,
            alignment: .topLeading
        )
        .background(Color.HPComponent.Section.background)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.HPComponent.shadowColor ,radius: 10, y: 4)
    }
}

extension AnalysisFWPMChart {
    @ViewBuilder
    var graph: some View {
        let title = "습관어 사용 횟수"
        let maxValue = maxFWPM()
        
        if !practices.isEmpty {
            Chart {
                /// 막대 그래프
                ForEach(Array(practices.enumerated()), id: \.1.id) { index, practice in
                    LineMark(
                        x: .value("연습회차", index + 1),
                        y: .value(title, practice.summary.fwpm)
                    )
                    .foregroundStyle(Color.HPPrimary.light)
                    .symbol {
                        Circle()
                            .strokeBorder(Color.HPPrimary.lighter, lineWidth: 3)
                            .background(Circle().fill(Color.HPComponent.Dot.background))
                            .frame(width: 12, height: 12)
                    }
                    .lineStyle(StrokeStyle(lineWidth: 3))
                }
                /// 가장 최근의 연습은 PointMark를 추가합니다.
                PointMark(
                    x: .value("연습 회차", practices.count),
                    y: .value(title,practices.last!.summary.fwpm)
                )
                .symbolSize(113)
                .foregroundStyle(Color.HPPrimary.base)
                /// 호버 효과
                if let selected {
                    RuleMark(
                        x: .value("Selected", selected + 1)
                    )
                    /// 호버 시 점선
                    .foregroundStyle(Color.clear)
                    .zIndex(0)
                    /// 호버 시 overlay
                    .annotation(
                        position: .leading, spacing: 0,
                        overflowResolution: .init(
                            x: .fit(to: .chart),
                            y: .disabled
                        )
                    ) {
                        VStack(spacing: 0) {
                            Text("\(practices[selected].summary.fwpm, specifier: "%.1f")회")
                                .systemFont(.caption2, weight: .bold)
                                .foregroundStyle(Color.HPTextStyle.dark)
                            HStack(spacing: 0) {
                                Text("\(Date().createAtToYMD(input: practices[selected].creatAt))")
                                    .systemFont(.caption2, weight: .medium)
                                    .foregroundStyle(Color.HPTextStyle.light)
                                Text(" | ")
                                    .systemFont(.caption2, weight: .medium)
                                    .foregroundStyle(Color.HPTextStyle.light)
                                Text("\(Date().createAtToHM(input: practices[selected].creatAt))")
                                    .systemFont(.caption2, weight: .medium)
                                    .foregroundStyle(Color.HPTextStyle.light)
                            }
                            .zIndex(5)
                        }
                        .padding(.horizontal, .HPSpacing.xxxsmall)
                        .background(Color.HPGray.systemWhite)
                        .cornerRadius(5)
                        .shadow(color: .HPComponent.shadowBlackColor, radius: 8)
                        .offset(x: 60)
                    }
                }
            }
            /// 호버 control
            .chartXSelection(value: $rawSelected)
            /// chart의 scroll을 설정합니다.
            .chartScrollableAxes(.horizontal)
            .chartScrollPosition(initialX: practices.count)
            .chartXScale(domain: [
                0.2, Double(practices.count) + 0.8
            ])
            /// 화면에 7회차까지의 연습을 표출합니다.
            .chartXVisibleDomain(length: 7)
            /// y축은 최저 값과 최고 값 차이의 1/8까지 표출합니다.
            .chartYScale(domain: [-maxValue / 8, maxValue * 9 / 8])
            /// x축 값
            .chartXAxis {
                AxisMarks(values: Array(stride(from: 1, to: practices.count + 2, by: 1))) { value in
                    AxisValueLabel(centered: false) {
                        Text("\(value.index + 1)회차")
                            .offset(x: -20)
                            .fixedSize()
                            .systemFont(.caption)
                            .foregroundStyle(Color.HPTextStyle.base)
                            .padding(.trailing, 18)
                    }
                }
            }
            /// y축 값
            .chartYAxis {
                /// y축은 5개의 값이 나타나도록
                /// 최저 값과 최고 값 차이의 1/4 간격으로 설정합니다.
                AxisMarks(position: .leading, values: Array(stride(
                    from: 0.0,
                    through: maxValue,
                    by: maxValue / 4
                ))) { value in
                    AxisValueLabel(centered: false) {
                        if value.index % 2 == 0 {
                            let axisValue = Double(value.index)
                                * maxValue / 4
                            Text("\(axisValue, specifier: "%.1f")")
                            .systemFont(.caption)
                            .foregroundStyle(Color.HPTextStyle.base)
                            .frame(width: 45, alignment: .center)
                            .padding(.trailing, 12)
                        }
                    }
                    AxisGridLine()
                }
            }
            .chartLegend(.hidden)
        }
    }
}

// MARK: - function
extension AnalysisFWPMChart {
    /// YAxis 범위
    func maxFWPM() -> Double {
        var answer = 0.0
        for practice in practices {
            answer = max(answer, practice.summary.fwpm)
        }
        return answer == 0.0 ? 1.0 : answer
    }
    /// 호버 관련 변수
    var selected: Int? {
        if let rawSelected {
            if 0 <= rawSelected - 1 && rawSelected - 1 < practices.count {
                return rawSelected - 1
            }
            return nil
        }
        return nil
    }
}
