//
//  StatisticsTabItem.swift
//  highpitch
//
//  Created by yuncoffee on 10/14/23.
//

import SwiftUI
import Charts

struct ProjectOutLine: View {
    @Environment(ProjectManager.self)
    private var projectManager
    @State
    var speakingRate = 0
    @State
    var fillerWordPerMinute = 0.0
    @State
    var isLevelTooltipActive = false
    
    var body: some View {
        if let practices = projectManager.current?.practices.sorted(by: { $0.creatAt < $1.creatAt }) {
            if (practices.count != 0) {
                /// 연습 진행 기간
                let startDate = Date().createAtToYMD(input: practices.first!.creatAt)
                let endDate = Date().createAtToYMD(input: practices.last!.creatAt)
                let practiceDuration = "\(startDate) - \(endDate)"
                
                ScrollView {
                    VStack(alignment:.leading, spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("총 \(practices.count)번의 연습에 대한 결과에요")
                                .systemFont(.largeTitle)
                                .foregroundStyle(Color.HPTextStyle.darker)
                            Text("\(practiceDuration) 동안 연습했어요")
                                .systemFont(.body)
                                .foregroundStyle(Color.HPTextStyle.base)
                        }
                        .padding(.bottom, .HPSpacing.xsmall)
                        HStack(spacing: .HPSpacing.xxxsmall + .HPSpacing.xxsmall) {
                            HStack(spacing: .HPSpacing.xxxsmall + .HPSpacing.xxsmall) {
                                speakingRateView(practices: practices)
                                fillerWordCountView(practices: practices)
                            }
                            speakingRateView(practices: practices)
                        }
                        .padding(.bottom, .HPSpacing.xxsmall)
                        /// [레벨, 습관어, 말 빠르기] 그래프
                        StatisticTabGraph()
                    }
                }.border(.red)
            } else { emptyView }
        } else { emptyView }
    }
}

extension ProjectOutLine {
    // MARK: - emptyView
    @ViewBuilder
    var emptyView: some View {
        VStack {
            Text("연습결과가 없습니다.")
        }
    }
    
    // MARK: - speakingRateView
    func speakingRateView(practices: [PracticeModel]) -> some View {
        VStack(spacing: 0) {
            Text("습관어")
                .systemFont(.body)
                .foregroundColor(Color.HPTextStyle.darker)
            Text("\(speakingRate)회")
                .systemFont(.largeTitle)
                .foregroundColor(Color.HPPrimary.base)
            Text("적절한 말 빠르기에요")
                .systemFont(.caption)
                .foregroundColor(Color.HPTextStyle.light)
        }
        .frame(minWidth: 50, maxWidth: .infinity, minHeight: 120, maxHeight: 120, alignment: .center)
        .background(Color.HPComponent.Section.background)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.HPComponent.shadowColor ,radius: 10, y: .HPSpacing.xxxxsmall)
        .onAppear {
            speakingRate = returnSpeakingRate(practices: practices)
        }
    }
    // MARK: - fillerWordCountView
    func fillerWordCountView(practices: [PracticeModel]) -> some View {
        VStack(spacing: 0) {
            Text("말 빠르기")
                .systemFont(.body)
                .foregroundColor(Color.HPTextStyle.darker)
            Text("\(speakingRate)SPM")
                .systemFont(.largeTitle)
                .foregroundColor(Color.HPPrimary.base)
            Text("적절한 말 빠르기에요")
                .systemFont(.caption)
                .foregroundColor(Color.HPTextStyle.light)
        }
        .border(.blue)
        .padding(.horizontal, .HPSpacing.small)
        .frame(minHeight: 120, maxHeight: 120, alignment: .leading)
        .background(Color.HPComponent.Section.background)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.HPComponent.shadowColor ,radius: 10, y: .HPSpacing.xxxxsmall)
        .onAppear {
            speakingRate = returnSpeakingRate(practices: practices)
            fillerWordPerMinute = fillerWordPerMinute(practices: practices)
        }
    }
    //MARK: - functions
    /// speakingRage(SPM)을 반환합니다.
    func returnSpeakingRate(practices: [PracticeModel]) -> Int {
        var answer = 0.0
        for practice in practices {
            answer += practice.summary.epmAverage
        }
        answer /= Double(practices.count)
        return Int(answer)
    }
    
    /// 분당 습관어 사용횟수를 반환합니다.
    func fillerWordPerMinute(practices: [PracticeModel]) -> Double {
        var answer = 0.0
        for practice in practices {
        }
        return answer
    }
}
