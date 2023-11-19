//
//  PracticeDetailContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI
#if PREVIEW
import SwiftData
#endif

struct PracticeDetailContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
    private let PRACTICE_DETAIL_VIEW_WIDTH = 440.0
    
#if PREVIEW
    // MARK: - MockData
    @Query(sort: \PracticeModel.creatAt)
    var practices: [PracticeModel]
#endif
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            header
            ZStack(alignment: .topLeading) {
                ScrollView {
                    viewStore.currentFeedbackViewType.feedbackContent
                        .padding(.top, .HPSpacing.xxxsmall)
                    FeedbackStyleScript()
                }
                .animation(nil, value: UUID())
                .padding(.bottom, .HPSpacing.medium)
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(
                            colors: [.HPGray.systemWhite, .HPGray.systemWhite.opacity(0)]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .offset(y: -.HPSpacing.xxxxsmall)
                    .frame(height: 24)
                GeometryReader { geometry in
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(
                                colors: [.HPGray.systemWhite.opacity(0), .HPGray.systemWhite]),
                            startPoint: .top,
                            endPoint: .bottom
                        ))
                        .frame(height: viewStore.AUDIO_CONTROLLER_HEIGHT)
                        .offset(y: geometry.size.height - viewStore.AUDIO_CONTROLLER_HEIGHT - 32)
                    
                }
            }
        }
        .border(.HPComponent.stroke, width: 1, edges: [.leading])
        .frame(
            minWidth: PRACTICE_DETAIL_VIEW_WIDTH,
            maxWidth: PRACTICE_DETAIL_VIEW_WIDTH,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .onAppear {
            // MARK: - Add MockData
#if PREVIEW
            if let sample = practices.first {
                viewStore.practice = sample
            }
#endif
        }
    }
}

extension PracticeDetailContainer {
    @ViewBuilder
    var header: some View {
        VStack(spacing: .HPSpacing.xxsmall) {
            HStack {
                segmentedControl
                Spacer()
                HPButton(type: .text, color: .HPTextStyle.light) {
                    print("리포트 보기")
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: ("리포트 보기", nil),
                        type: type,
                        size: size,
                        color: color,
                        expandable: expandable
                    )
                }
                .fixedSize()
            }
            if viewStore.currentFeedbackViewType == .speed {
                speedTabRadios
            }
        }
        .padding(.top, .HPSpacing.xsmallBetweenSmall)
        .padding(.bottom, .HPSpacing.small)
        .padding(.leading, .HPSpacing.small)
        .padding(.trailing, .HPSpacing.medium)
    }
    
    @ViewBuilder
    var segmentedControl: some View {
        HStack {
            ForEach(FeedbackViewType.allCases, id: \.rawValue) { option in
                let isSelected = viewStore.currentFeedbackViewType == option
                HPButton(
                    type: .roundFill,
                    size: .small,
                    color: isSelected ? .HPSecondary.base : .HPGray.system200) {
                    print("select \(option.rawValue)")
                        withAnimation {
                            viewStore.currentFeedbackViewType = option
                        }
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: ("\(option.rawValue)", nil),
                        type: type,
                        size: size,
                        color: color,
                        contentColor: isSelected ? .HPGray.systemWhite : .HPTextStyle.base,
                        expandable: expandable,
                        padding: (.HPSpacing.xxxxsmall, .HPSpacing.xxsmall)
                    )
                }
                .fixedSize()
            }
        }
    }
    
    @ViewBuilder
    var speedTabRadios: some View {
        HStack(spacing: .HPSpacing.xsmall) {
            Button {
                withAnimation(.interpolatingSpring(stiffness: 300, damping: 15)) {
                    viewStore.scriptViewSpeedType = .fast
                }
            } label: {
                HStack {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 1)
                            .fill(viewStore.scriptViewSpeedType == .fast ? Color.HPOrange.light : Color.HPComponent.stroke2 )
                            .frame(width: 18, height: 18)
                        Circle()
                            .fill(Color.HPOrange.base)
                            .scaleEffect(viewStore.scriptViewSpeedType == .fast ? 1 : 0, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .opacity(viewStore.scriptViewSpeedType == .fast ? 1 : 0)
                            .frame(width: 10, height: 10)
                    }
                    Text("빠른 구간")
                        .systemFont(.caption, weight: .semibold)
                        .foregroundStyle(Color.HPSecondary.base)
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            Button {
                withAnimation(.interpolatingSpring(stiffness: 300, damping: 15)) {
                    viewStore.scriptViewSpeedType = .slow
                }
            } label: {
                HStack {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 1)
                            .fill(viewStore.scriptViewSpeedType == .slow ? Color.HPOrange.light : Color.HPComponent.stroke2 )
                            .frame(width: 18, height: 18)
                        Circle()
                            .fill(Color.HPOrange.base)
                            .scaleEffect(viewStore.scriptViewSpeedType == .slow ? 1 : 0, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .opacity(viewStore.scriptViewSpeedType == .slow ? 1 : 0)
                            .frame(width: 10, height: 10)
                    }
                    Text("느린 구간")
                        .systemFont(.caption, weight: .semibold)
                        .foregroundStyle(Color.HPSecondary.base)
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    
    return VStack {
        PracticeDetailContainer()
            .modelContainer(modelContainer)
            .environment(PracticeViewStore(
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
    .frame(minHeight: 320)
    
}
