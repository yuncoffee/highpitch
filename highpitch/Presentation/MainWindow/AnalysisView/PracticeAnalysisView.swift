//
//  PracticeAnalysisView.swift
//  highpitch
//
//  Created by 이용준의 Macbook on 11/19/23.
//

import SwiftUI

struct PracticeAnalysisView: View {
    @Environment(ProjectManager.self)
    private var projectManager
    
    var body: some View {
        if let projects = projectManager.projects {
            let practiceCount = returnPracticeCount(projects: projects)
            if practiceCount != 0 {
                /// 연습 진행 기간
                let practiceDurationArray = returnPracticeDuration(projects: projects)
                // swiftlint: disable line_length
                let practiceDuration = " | \(Date().createAtToYMD(input: practiceDurationArray.first!)) - \(Date().createAtToYMD(input: practiceDurationArray.last!))"
                // swiftlint: enable line_length
                ScrollView {
                    VStack(alignment:.leading, spacing: .HPSpacing.xxxxsmall) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("총 \(practiceCount)번의 연습에 대한 결과에요")
                                .systemFont(.largeTitle)
                                .foregroundStyle(Color.HPTextStyle.darker)
                            HStack(spacing: 0) {
                                Text("\(projects.count)개의 프로젝트")
                                    .systemFont(.body, weight: .bold)
                                    .foregroundStyle(Color.HPTextStyle.dark)
                                Text("\(practiceDuration)")
                                    .systemFont(.body, weight: .medium)
                                    .foregroundStyle(Color.HPTextStyle.light)
                            }
                        }
                        .padding(.bottom, .HPSpacing.xsmall + .HPSpacing.xxsmall)
                        Text("요약 보기")
                            .systemFont(.subTitle, weight: .semibold)
                            .foregroundColor(Color.HPTextStyle.darker)
                            .padding(.bottom, .HPSpacing.xsmall)
                        HStack(spacing: .HPSpacing.xxxsmall + .HPSpacing.xxsmall) {
                            HStack(spacing: .HPSpacing.xxxsmall + .HPSpacing.xxsmall) {
                                speakingRateView(projects: projects, practiceCount: practiceCount)
                                fillerWordCountView(projects: projects, practiceCount: practiceCount)
                            }
                            fillerWordTOP3View(projects: projects, practiceCount: practiceCount)
                        }
                        .padding(.bottom, .HPSpacing.small + .HPSpacing.xxsmall)
                        Text("회차별 그래프 보기")
                            .systemFont(.subTitle, weight: .semibold)
                            .foregroundColor(Color.HPTextStyle.darker)
                            .padding(.bottom, .HPSpacing.xsmall)
                        AnalysisFWPMChart()
                            .padding(.bottom, .HPSpacing.small)
                        AnalysisSpeedRateChart()
                            .padding(.bottom, .HPSpacing.xxsmall + .HPSpacing.xxxsmall)
                    }
                    .padding(.vertical, .HPSpacing.xxsmall + .HPSpacing.xsmall)
                    .padding(.horizontal, .HPSpacing.medium)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            } else {
                emptyView
            }
        } else {
            emptyView
        }
    }
}

// MARK: - functions
extension PracticeAnalysisView {
    /// practice의 수를 반환합니다.
    func returnPracticeCount(projects: [ProjectModel]) -> Int {
        var answer = 0
        for project in projects {
            answer += project.practices.count
        }
        return answer
    }
    
    /// practiceDuration의 수를 반환합니다.
    func returnPracticeDuration(projects: [ProjectModel]) -> [String] {
        var startDate: String?
        var endDate: String?
        for project in projects {
            for practice in project.practices {
                if (startDate == nil) {
                    startDate = practice.creatAt
                } else {
                    startDate! = min(practice.creatAt, startDate!)
                }
                if (endDate == nil) {
                    endDate = practice.creatAt
                } else {
                    endDate! = max(practice.creatAt, endDate!)
                }
            }
        }
        return [startDate ?? "", endDate ?? ""]
    }
    
    /// speakingRage(SPM)을 반환합니다.
    func returnSpeakingRate(projects: [ProjectModel], practiceCount: Int) -> Int {
        var answer = 0.0
        for project in projects {
            for practice in project.practices {
                answer += practice.summary.spmAverage
            }
        }
        answer /= Double(practiceCount)
        return Int(answer)
    }
    
    /// fwpmAverage를 반환합니다.
    func returnFWPMAverage(projects: [ProjectModel], practiceCount: Int) -> Double {
        var answer = 0.0
        for project in projects {
            for practice in project.practices {
                answer += practice.summary.fwpm
            }
        }
        answer /= Double(practiceCount)
        return answer
    }
    
    /// fillerWordTOP3를 반환합니다.
    func returnfillerWordTOP3(projects: [ProjectModel]) -> [(key: String, value: Int)] {
        var answer: [String: Int] = [:]
        for project in projects {
            for practice in project.practices {
                for fillerWord in practice.summary.eachFillerWordCount {
                    if answer[fillerWord.fillerWord] == nil {
                        answer[fillerWord.fillerWord] = fillerWord.count
                    } else {
                        answer[fillerWord.fillerWord] = answer[fillerWord.fillerWord]! + fillerWord.count
                    }
                }
            }
        }
        var sortedAnswer = answer.sorted { $0.1 > $1.1 }
        while !sortedAnswer.isEmpty && sortedAnswer.last!.value == 0 { _ = sortedAnswer.popLast() }
        while sortedAnswer.count > 3 { _ = sortedAnswer.popLast() }
        return sortedAnswer
    }
}

extension PracticeAnalysisView {
    // MARK: - emptyView
    @ViewBuilder
    var emptyView: some View {
        VStack(spacing: .zero) {
            Text("연습 기록이 없어요")
                .systemFont(.body, weight: .semibold)
                .foregroundStyle(Color.HPTextStyle.base)
            Text("첫번째 연습을 시작해보세요")
                .systemFont(.caption, weight: .semibold)
                .foregroundStyle(Color.HPTextStyle.light)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: - speakingRateView
    func speakingRateView(projects: [ProjectModel], practiceCount: Int) -> some View {
        let speakingRate = returnSpeakingRate(projects: projects, practiceCount: practiceCount)
        return VStack(spacing: 0) {
            Text("말 빠르기")
                .systemFont(.body)
                .foregroundColor(Color.HPTextStyle.darker)
            Text("\(speakingRate)SPM")
                .systemFont(.largeTitle)
                .foregroundColor(Color.HPPrimary.base)
            Text(speakingRate >= 410
                 ? "빠른 편이에요"
                 : speakingRate >= 370
                 ? "조금 빠른 편이에요"
                 : speakingRate >= 330
                 ? "적절한 빠르기에요"
                 : speakingRate >= 290
                 ? "조금 느린 편이에요"
                 : "느린 편이에요"
            )
                .systemFont(.caption)
                .foregroundColor(Color.HPTextStyle.light)
        }
        .frame(minWidth: 50, maxWidth: .infinity, minHeight: 124, maxHeight: 124, alignment: .center)
        .background(Color.HPComponent.Section.background)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.HPComponent.shadowColor ,radius: 10, y: .HPSpacing.xxxxsmall)
    }
    // MARK: - fillerWordCountView
    func fillerWordCountView(projects: [ProjectModel], practiceCount: Int) -> some View {
        let fwpm = returnFWPMAverage(projects: projects, practiceCount: practiceCount)
        return VStack(spacing: 0) {
            Text("습관어 사용")
                .systemFont(.body)
                .foregroundColor(Color.HPTextStyle.darker)
            HStack(alignment: .bottom, spacing: .HPSpacing.xxxxsmall) {
                Text("분당")
                    .systemFont(.caption2)
                    .foregroundColor(Color.HPTextStyle.light)
                    .offset(y: -7)
                Text("\(fwpm, specifier: "%.1f")회")
                    .systemFont(.largeTitle)
                    .foregroundColor(Color.HPPrimary.base)
            }
            Text("적절한 편이에요")
                .systemFont(.caption)
                .foregroundColor(Color.HPTextStyle.light)
        }
        .frame(minWidth: 50, maxWidth: .infinity, minHeight: 124, maxHeight: 124, alignment: .center)
        .background(Color.HPComponent.Section.background)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.HPComponent.shadowColor ,radius: 10, y: .HPSpacing.xxxxsmall)
    }
    
    // MARK: - fillerWordTOP3View
    func fillerWordTOP3View(projects: [ProjectModel], practiceCount: Int) -> some View {
        let fillerWordTOP3 = returnfillerWordTOP3(projects: projects)
        
        return VStack(spacing: 0) {
            Text("많이 사용한 습관어")
                .systemFont(.body)
                .foregroundColor(Color.HPTextStyle.darker)
            if fillerWordTOP3.isEmpty {
                Text("지금까지 습관어 사용이 없었어요")
                    .systemFont(.footnote)
                    .foregroundColor(Color.HPTextStyle.light)
                    .padding(.top, .HPSpacing.xsmall)
            } else {
                ZStack {
                    HStack(alignment: .bottom, spacing: 0) {
                        ForEach(fillerWordTOP3, id: \.key) { fillerWord, _ in
                            Text(fillerWord)
                                .systemFont(.largeTitle)
                                .foregroundColor(Color.HPPrimary.base)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    HStack(alignment: .bottom, spacing: 0) {
                        ForEach(fillerWordTOP3, id: \.key) { fillerWord, _ in
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(minWidth: 10, maxWidth: .infinity, minHeight: 27, maxHeight: 27)
                                .border(
                                    Color.HPComponent.stroke,
                                    width: 1,
                                    edges: fillerWordTOP3.last!.key != fillerWord ? [.trailing] : []
                                )
                        }
                    }
                }
                .padding(.horizontal, .HPSpacing.small)
                .padding(.vertical, .HPSpacing.xxsmall)
            }
        }
        .frame(minWidth: 50, maxWidth: .infinity, minHeight: 124, maxHeight: 124, alignment: .center)
        .background(Color.HPComponent.Section.background)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.HPComponent.shadowColor ,radius: 10, y: .HPSpacing.xxxxsmall)
    }
}
