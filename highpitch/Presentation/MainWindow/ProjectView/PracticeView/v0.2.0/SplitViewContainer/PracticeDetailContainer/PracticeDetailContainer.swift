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
            ScrollView {
                viewStore.currentFeedbackViewType.feedbackContent
                FeedbackStyleScript()
            }
            .animation(nil, value: UUID())
            .padding(.bottom, .HPSpacing.medium)
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
    .frame(minHeight: 600)
    
}
