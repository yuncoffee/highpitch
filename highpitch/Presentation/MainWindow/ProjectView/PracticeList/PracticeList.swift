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
    
    var body: some View {
        @Bindable var projectManager = projectManager
        
        VStack(spacing: 0) {
            header
            ScrollView {
                VStack(spacing: .HPSpacing.xxxxsmall) {
                    HStack(spacing: .zero) {
                        Text("") // 아이콘 대체
                            .frame(minWidth: 36, maxWidth: 36, minHeight: 36, maxHeight: 36)
                            .padding(.leading, .HPSpacing.medium)
                        Text("연습 회차")
                            .systemFont(.caption)
                            .foregroundStyle(Color.HPTextStyle.light)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: -(36 + .HPSpacing.small))
                        Text("연습 일시")
                            .systemFont(.caption)
                            .foregroundStyle(Color.HPTextStyle.light)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("소요 시간")
                            .systemFont(.caption)
                            .foregroundStyle(Color.HPTextStyle.light)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("") // 아이콘 대체
                            .frame(minWidth: 36, maxWidth: 36, minHeight: 36, maxHeight: 36)
                    }
                    .padding(.top, .HPSpacing.xsmall)
                    .padding(.bottom, .HPSpacing.xxsmall)
                    .padding(.horizontal, .HPSpacing.small)
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
                                        isEditMode: isEditMode
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
        .onAppear {
            if let current = projectManager.current {
                practices = current.practices.sorted(by: {$0.creatAt > $1.creatAt})
            }
        }
        .onChange(of: projectManager.current?.practices, { _, _ in
            if let current = projectManager.current {
                practices = current.practices.sorted(by: {$0.creatAt > $1.creatAt})
            }
        })
        .onChange(of: selectedPractices) { _, newValue in
            print(newValue.count)
        }
        .onDisappear {
            isEditMode = false
            selectedPractices = []
        }
    }
}

extension PracticeList {
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
                        print(error)
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
