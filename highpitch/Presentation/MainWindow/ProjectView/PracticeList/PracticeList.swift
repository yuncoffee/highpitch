//
//  PracticeList.swift
//  highpitch
//
//  Created by yuncoffee on 10/23/23.
//

import SwiftUI
import SwiftData

struct PracticeList: View {
    @Environment(\.modelContext)
    var modelContext
    @Environment(ProjectManager.self)
    private var projectManager
    @State
    private var practices: [PracticeModel] = []
    @State
    private var isEditMode = false
    @State
    private var selectedPractices: [PracticeModel] = []
    @State
    private var isDeleteSheetActive = false
    @State
    private var refreshable = false

    var body: some View {
        @Bindable var projectManager = projectManager
        VStack(spacing: 0) {
            if practices.isEmpty {
                emptyView
            } else {
                VStack(spacing: 0) {
                    header
                    ScrollView {
                        VStack(spacing: .HPSpacing.xxxxsmall) {
                            HStack(spacing: .zero) {
                                HStack(spacing: .HPSpacing.small) {
                                    Text("")
                                        .frame(height: 36)
                                    Text("연습 회차")
                                        .systemFont(.caption)
                                        .foregroundStyle(Color.HPTextStyle.light)
                                        .offset(x: 8)
                                }
                                .frame(minWidth: 151, maxWidth: .infinity, alignment: .leading)
                                Text("연습 일시")
                                    .systemFont(.caption)
                                    .foregroundStyle(Color.HPTextStyle.light)
                                    .frame(minWidth: 160, maxWidth: .infinity, alignment: .leading)
                                Text("소요 시간")
                                    .systemFont(.caption)
                                    .foregroundStyle(Color.HPTextStyle.light)
                                    .frame(minWidth: 80, maxWidth: .infinity, alignment: .leading)
                                Text("")
                                    .foregroundStyle(Color.HPGray.system400)
                                    .frame(minWidth: 12, maxWidth: 12, minHeight: 12, maxHeight: 12)
                                    .frame(minWidth: 36, maxWidth: 36, minHeight: 36, maxHeight: 36)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.top, .HPSpacing.xsmall)
                            .padding(.bottom, .HPSpacing.xxsmall)
                            .padding(.leading, .HPSpacing.small)
                            .border(.HPComponent.stroke, width: 1, edges: [.bottom])
                            .padding(.horizontal, .HPSpacing.xxsmall)
                            NavigationStack(path: $projectManager.path) {
                                LazyVGrid(columns: [GridItem()], spacing: .HPSpacing.xxxxsmall) {
                                    ForEach(Array(practices.enumerated()), id: \.1.id) { index, practice in
                                        NavigationLink(value: practice) {
                                            PracticeListCell(
                                                practice: practice,
                                                index: index,
                                                selectedPractices: $selectedPractices,
                                                refreshable: $refreshable,
                                                isEditMode: isEditMode,
                                                isRemarkable: practice.remarkable
                                            )
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                                .navigationDestination(for: PracticeModel.self) { practice in
                                    PracticeView(
                                        viewStore: PracticeViewStore(
                                            projectName: projectManager.current?.projectName ?? "",
                                            practice: practice,
                                            mediaManager: MediaManager()
                                        ),
                                        title: projectManager.current?.projectName
                                    )
                                    .onAppear {
                                        isEditMode = false
                                    }
                                    
                                }
                                .padding(.bottom, .HPSpacing.xxsmall)
                            }
                        }
                        .background(Color.HPComponent.Section.background)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(color: Color.HPComponent.shadowColor ,radius: 10, y: .HPSpacing.xxxxsmall)
                        .padding(.bottom, .HPSpacing.small)
                        .padding(.leading, .HPSpacing.medium + .HPSpacing.xxxxsmall)
                        .padding(.trailing, .HPSpacing.large)
                    }
                }
                .sheet(isPresented: $isDeleteSheetActive) {
                    sheet
                }
            }
            
        }
        .onAppear {
            if let current = projectManager.current {
                var remarks: [PracticeModel] = []
                var unRemarks: [PracticeModel]  = []
                current.practices.sorted(by: {$0.creatAt > $1.creatAt}).forEach { practice in
                    if practice.remarkable {
                        remarks.append(practice)
                    } else {
                        unRemarks.append(practice)
                    }
                }
                practices = remarks + unRemarks
            }
        }
        .onChange(of: refreshable, { _, _ in
            refreshable = false
            if let current = projectManager.current {
                var remarks: [PracticeModel] = []
                var unRemarks: [PracticeModel]  = []
                current.practices.sorted(by: {$0.creatAt > $1.creatAt}).forEach { practice in
                    if practice.remarkable {
                        remarks.append(practice)
                    } else {
                        unRemarks.append(practice)
                    }
                }
                practices = remarks + unRemarks
            }
        })
        .onChange(of: projectManager.current?.practices, { _, _ in
            if let current = projectManager.current {
                var remarks: [PracticeModel] = []
                var unRemarks: [PracticeModel]  = []
                current.practices.sorted(by: {$0.creatAt > $1.creatAt}).forEach { practice in
                    if practice.remarkable {
                        remarks.append(practice)
                    } else {
                        unRemarks.append(practice)
                    }
                }
                practices = remarks + unRemarks
            }
        })
        .onChange(of: selectedPractices) { _, newValue in
            #if DEBUG
            print(newValue.count)
            #endif
        }
        .onDisappear {
            isEditMode = false
            selectedPractices = []
        }
    }
}

extension PracticeList {
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
    
    func editList() {
        if isEditMode && !selectedPractices.isEmpty {
            isDeleteSheetActive = true
        } else {
            isEditMode.toggle()
        }
    }
    
    func removeList() {
        selectedPractices.forEach { item in
            let index = projectManager.current?.practices.firstIndex(of: item)
            if let index = index {
                projectManager.current?.practices.remove(at: index)
            }
            Task {
                await MainActor.run {
                    modelContext.delete(item)
                    do {
                        try modelContext.save()
                    } catch {
                        #if DEBUG
                        print(error)
                        #endif
                    }
                }
            }
            isDeleteSheetActive = false
            isEditMode = false
        }
    }
}

extension PracticeList {
    @ViewBuilder
    var header: some View {
        HStack(spacing: 0) {
            if isEditMode {
                Text("\(selectedPractices.count)개 선택")
                    .systemFont(.footnote, weight: .semibold)
                    .foregroundStyle(Color.HPPrimary.base)
            }
            Spacer()
            Button {
                editList()
            } label: {
                Text(isEditMode ? "삭제하기" : "편집하기")
                    .systemFont(.footnote, weight: .semibold)
                    .foregroundStyle(isEditMode ? Color.HPRed.base : Color.HPPrimary.base)
            }
            .buttonStyle(.plain)
        }
        .padding(.bottom, .HPSpacing.xxxsmall)
        .padding(.leading, .HPSpacing.xxxlarge + .HPSpacing.xxsmall)
        .padding(.trailing, .HPSpacing.large)
        .frame(alignment: .trailing)
    }

    @ViewBuilder
    var sheet: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                isDeleteSheetActive = false
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                    .foregroundStyle(Color.HPGray.system800)
            }
            .buttonStyle(.plain)
            .frame(width: 28, height: 28)
            .offset(x: -16, y: 16)
            VStack(alignment: .center, spacing: .zero) {
                VStack(spacing: .HPSpacing.xsmall) {
                    Image(systemName: "exclamationmark.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(Color.HPGray.system400)
                        .frame(maxWidth: 32, maxHeight: 32)
                    VStack(spacing: .HPSpacing.xxxsmall) {
                        Text("연습 기록을 삭제하시겠어요?")
                            .systemFont(.subTitle)
                            .foregroundStyle(Color.HPTextStyle.darker)
                        Text("한 번 삭제한 기록은 복구할 수 없어요.")
                            .systemFont(.caption)
                            .foregroundStyle(Color.HPTextStyle.base)
                    }
                    .padding(.bottom, .HPSpacing.medium)
                }
                HStack(spacing: .HPSpacing.xxsmall) {
                    HPButton(color: .HPGray.system200) {
                        isDeleteSheetActive = false
                    } label: { type, size, color, expandable in
                        HPLabel(
                            content: ("취소하기", nil),
                            type: type,
                            size: size,
                            color: color,
                            contentColor: Color.HPTextStyle.darker,
                            expandable: expandable
                        )
                    }
                    .frame(maxWidth: 144)
                    HPButton(color: .HPRed.base) {
                        removeList()
                    } label: { type, size, color, expandable in
                        HPLabel(
                            content: ("삭제하기", nil),
                            type: type,
                            size: size,
                            color: color,
                            expandable: expandable
                        )
                    }
                    .frame(maxWidth: 144)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(minWidth: 420, maxWidth: 420, minHeight: 280, maxHeight: 280)
    }
}

#Preview {
    ZStack(alignment: .topTrailing) {
        Button {
//            isDeleteSheetActive = false
        } label: {
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 14, height: 14)
                .foregroundStyle(Color.HPGray.system800)
        }
        .buttonStyle(.plain)
        .frame(width: 28, height: 28)
        .offset(x: -16, y: 16)
        .border(.red)
        VStack(spacing: .HPSpacing.medium) {
            VStack(spacing: .HPSpacing.xsmall) {
                Image(systemName: "exclamationmark.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .foregroundStyle(Color.HPGray.system400)
                    .frame(maxWidth: 32, maxHeight: 32)
                VStack(spacing: .HPSpacing.xxxsmall) {
                    Text("연습 기록을 삭제하시겠어요?")
                        .systemFont(.subTitle)
                        .foregroundStyle(Color.HPTextStyle.darker)
                    Text("한 번 삭제한 기록은 복구할 수 없어요.")
                        .systemFont(.caption)
                        .foregroundStyle(Color.HPTextStyle.base)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack(spacing: .HPSpacing.xxsmall) {
                HPButton(color: .HPGray.system200) {
//                    isDeleteSheetActive = false
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: ("취소하기", nil),
                        type: type,
                        size: size,
                        color: color,
                        contentColor: Color.HPTextStyle.darker,
                        expandable: expandable
                    )
                }
                .frame(maxWidth: 144)
                HPButton(color: .HPRed.base) {
//                    removeList()
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: ("삭제하기", nil),
                        type: type,
                        size: size,
                        color: color,
                        expandable: expandable
                    )
                }
                .frame(maxWidth: 144)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .border(.red)
    }
    .frame(maxWidth: 420, maxHeight: 280)
    .padding(.top, .HPSpacing.xxlarge)
    .padding(.bottom, .HPSpacing.medium)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .border(.blue)
}
