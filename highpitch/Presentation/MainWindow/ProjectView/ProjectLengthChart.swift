//
//  ProjectLengthChart.swift
//  highpitch
//
//  Created by 이용준의 Macbook on 11/18/23.
//

import Charts
import SwiftUI

struct ProjectLengthChart: View {
    
    @Environment(ProjectManager.self)
    private var projectManager
    @State
    var rawSelected: Int?
    
    var body: some View {
        VStack(alignment: .leading, spacing: .HPSpacing.xsmall) {
            Text("연습 소요시간")
                .systemFont(.subTitle)
                .foregroundStyle(Color.HPTextStyle.darker)
            ZStack(alignment: .topLeading) {
                Text("(분 : 초)")
                    .systemFont(.caption2)
                    .foregroundStyle(Color.HPTextStyle.base)
                    .offset(x: 11, y: -12)
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

extension ProjectLengthChart {
    @ViewBuilder
    var graph: some View {
        let practices = projectManager.current?.practices.sorted(by: { $0.creatAt < $1.creatAt })
        
        if let practices = practices, !practices.isEmpty {
            let title = "연습 소요시간"
            let maxValue = maxLength()
            
            Chart {
                /// 막대 그래프
                ForEach(Array(practices.enumerated()), id: \.1.id) { index, practice in
                    BarMark(
                        x: .value("연습회차", index + 1),
                        y: .value(title, practice.summary.practiceLength),
                        width: MarkDimension(integerLiteral: 20)
                    )
                    .foregroundStyle(Color.HPComponent.timeGraph)
                }
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
                            // swiftlint: disable line_length
                            Text("\(Date().secondToKoreanMS(Int(practices[selected].summary.practiceLength))) 소요")
                                .systemFont(.caption2, weight: .bold)
                                .foregroundStyle(Color.HPTextStyle.dark)
                            // swiftlint: enable line_length
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
            .chartYScale(domain: [0, maxValue * 9 / 8])
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
                            Text("\(Date().secondToMS(Int(axisValue)))")
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

extension ProjectLengthChart {
    /// YAxis 범위
    func maxLength() -> Double {
        let practices = projectManager.current?.practices.sorted(
            by: { $0.summary.practiceLength < $1.summary.practiceLength }
        )
        var answer = 0.0
        if let practices = practices, !practices.isEmpty {
            answer = practices.last!.summary.practiceLength
        }
        return answer == 0.0 ? 1.0 : answer
    }
    
    /// 호버 관련 변수
    var selected: Int? {
        let practices = projectManager.current?.practices.sorted(by: { $0.creatAt < $1.creatAt })
        if let rawSelected {
            if 0 <= rawSelected - 1 && rawSelected - 1 < practices?.count ?? 0 {
                return rawSelected - 1
            }
            return nil
        }
        return nil
    }
}
