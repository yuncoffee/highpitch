//
//  ProjectSpeakingRateView.swift
//  highpitch
//
//  Created by 이용준의 Macbook on 11/15/23.
//

import Charts
import SwiftUI

struct ProjectSpeakingRateChart: View {
    @Environment(ProjectManager.self)
    private var projectManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: .HPSpacing.xsmall) {
            Text("평균 말 빠르기")
                .systemFont(.subTitle)
                .foregroundStyle(Color.HPTextStyle.darker)
            ZStack(alignment: .topLeading) {
                Text("(평균속도: SPM)")
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
            minWidth: 286,
            maxWidth: .infinity,
            minHeight: 286,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .background(Color.HPComponent.Section.background)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.HPComponent.shadowColor ,radius: 10, y: 4)
    }
}

extension ProjectSpeakingRateChart {
    @ViewBuilder
    var graph: some View {
        let practices = projectManager.current?.practices.sorted(by: { $0.creatAt < $1.creatAt })
        
        if let practices = practices, !practices.isEmpty {
            let title = "평균 말 빠르기"
            let range = spmValueRange()
            
            Chart {
                /// 선 그래프
                ForEach(practices) { practice in
                    LineMark(
                        x: .value("연습회차", practice.index + 1),
                        y: .value(title, practice.summary.epmAverage)
                    )
                    .foregroundStyle(Color.HPPrimary.light)
                    .symbol {
                        Circle()
                            .strokeBorder(Color.HPPrimary.lighter, lineWidth: 3)
                            .background(Circle().fill(Color.HPComponent.Section.background))
                            .frame(width: 12, height: 12)
                    }
                    .lineStyle(StrokeStyle(lineWidth: 3))
                }
                /// 가장 최근의 연습은 PointMark를 추가합니다.
                PointMark(
                    x: .value("연습 회차", practices.last!.index + 1),
                    y: .value(title, practices.last!.summary.epmAverage)
                )
                .symbolSize(113)
                .foregroundStyle(Color.HPPrimary.base)
            }
            /// chart의 scroll을 설정합니다.
            .chartScrollableAxes(.horizontal)
            .chartScrollPosition(initialX: practices.count)
            .chartXScale(domain: [
                0.5, Double(practices.count) + 0.5
            ])
            /// 화면에 5회차까지의 연습을 표출합니다.
            .chartXVisibleDomain(length: 5)
            /// y축은 최저 값과 최고 값 차이의 1/8까지 표출합니다.
            .chartYScale(domain: [
                range.first! -
                (range.last! - range.first!) / 8,
                range.last! +
                (range.last! - range.first!) / 8
            ])
            /// x축 값
            .chartXAxis {
                AxisMarks(values: Array(stride(from: 1, to: practices.count + 2, by: 1))) { value in
                    AxisValueLabel(centered: false) {
                        Text("\(value.index + 1)회차")
                            .offset(x: -17, y: -7)
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
                    from: range.first!,
                    through: range.last!,
                    by: (range.last! - range.first!) / 4
                ))) { value in
                    AxisValueLabel(centered: false) {
                        if value.index % 2 == 0 {
                            let axisValue = Double(value.index)
                                * (range.last! - range.first!) / 4
                                + range.first!
                            Text("\(axisValue, specifier: "%.1f")")
                            .systemFont(.caption)
                            .foregroundStyle(Color.HPTextStyle.base)
                            .padding(.trailing, 18)
                        }
                    }
                    AxisGridLine()
                }
            }
            .chartLegend(.hidden)
        }
    }
}

extension ProjectSpeakingRateChart {
    /// YAxis 범위
    func spmValueRange() -> [Double] {
        let practices = projectManager.current?.practices.sorted(
            by: { $0.summary.epmAverage < $1.summary.epmAverage }
        )
        if let practices = practices, !practices.isEmpty {
            if ( practices.first!.summary.epmAverage ==
                 practices.last!.summary.epmAverage) {
                return [
                    practices.first!.summary.epmAverage - 25,
                    practices.first!.summary.epmAverage + 25
                ]
            }
            return [
                practices.first!.summary.epmAverage,
                practices.last!.summary.epmAverage
            ]
        }
        return []
    }
}
