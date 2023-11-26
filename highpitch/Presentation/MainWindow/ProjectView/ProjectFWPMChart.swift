//
//  ProjectFWPMChart.swift
//  highpitch
//
//  Created by 이용준의 Macbook on 11/18/23.
//

import Charts
import SwiftUI

struct ProjectFWPMChart: View {
    
    @Environment(ProjectManager.self)
    private var projectManager
    @State
    var rawSelected: Int?
    @State
    var rawSelectedRange: ClosedRange<Int>?
    
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
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .background(Color.HPComponent.Section.background)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.HPComponent.shadowColor ,radius: 10, y: 4)
    }
}

extension ProjectFWPMChart {
    @ViewBuilder
    var graph: some View {
        let practices = projectManager.current?.practices.sorted(by: { $0.creatAt < $1.creatAt })
        
        if let practices = practices, !practices.isEmpty {
            let title = "습관어 사용 횟수"
            let maxValue = maxFWPM()
            
            Chart {
                /// 막대 그래프
                ForEach(practices) { practice in
                    BarMark(
                        x: .value("연습회차", practice.index + 1),
                        y: .value(title, practice.summary.fwpm),
                        width: MarkDimension(integerLiteral: 20)
                    )
                    .foregroundStyle(Color.HPPrimary.base)
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
                            // MARK: - Fata Error: Index out of range
//                            Text("\(practices[selected].summary.fwpm, specifier: "%.1f")회")
//                                .systemFont(.caption2, weight: .bold)
//                                .foregroundStyle(Color.HPTextStyle.dark)
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
            .chartXSelection(range: $rawSelectedRange)
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

extension ProjectFWPMChart {
    /// YAxis 범위
    func maxFWPM() -> Double {
        let practices = projectManager.current?.practices.sorted(
            by: { $0.summary.fwpm < $1.summary.fwpm }
        )
        var answer = 0.0
        if let practices = practices, !practices.isEmpty {
            answer = practices.last!.summary.fwpm
        }
        return answer == 0.0 ? 1.0 : answer
    }
    
    /// 호버 관련 변수
    var selected: Int? {
        let practices = projectManager.current?.practices.sorted(by: { $0.index < $1.index })
        if let practices = practices {
            if let rawSelected {
                return practices.first(where: {
                    return ($0.index ... $0.index + 1).contains(rawSelected)
                })?.index
            } else if let selectedRange, selectedRange.lowerBound == selectedRange.upperBound {
                return selectedRange.lowerBound
            }
            return nil
        } else { return nil }
    }
    var selectedRange: ClosedRange<Int>? {
        let practices = projectManager.current?.practices.sorted(by: { $0.index < $1.index })
        if let practices = practices {
            if let rawSelectedRange {
                let lower = practices.first(where: {
                    return ($0.index ... $0.index + 1).contains(rawSelectedRange.lowerBound)
                })?.index
                let upper = practices.first(where: {
                    return ($0.index ... $0.index + 1).contains(rawSelectedRange.upperBound)
                })?.index
                
                if let lower, let upper {
                    return lower ... upper
                }
            }
            return nil
        } else { return nil }
    }
}
