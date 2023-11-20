//
//  MenubarExtraContent.swift
//  highpitch
//
//  Created by yuncoffee on 10/19/23.
//

import SwiftUI
import SwiftData

struct MenubarExtraContent: View {
    @Environment(\.openWindow)
    private var openWindow
 
    @Environment(ProjectManager.self)
    private var projectManager
    @Environment(KeynoteManager.self)
    private var keynoteManager
    
    @Query(sort: \ProjectModel.creatAt)
    var projectModels: [ProjectModel]
    @Binding
    var selectedProject: ProjectModel?

    @State
    private var selectedProjectName = "새 프로젝트 생성"
    @State
    private var projectNameOptions: [String] = ["새 프로젝트 생성"]
    
    var body: some View {
        VStack(spacing: 0) {
            sectionProject
        }
        .onAppear {
            projectNameOptions.append(contentsOf: projectModels.map {$0.projectName})
        }
        /// 선택된 프로젝트가 변경되었음
        .onChange(of: selectedProject, { _, newValue in
            if let newValue = newValue {
                selectedProjectName = newValue.projectName
                if !keynoteManager.opendKeynotes.isEmpty {
                }
            } else {
                selectedProjectName = "새 프로젝트 생성"
            }
        })
        /// 프로젝트 모델이 변경되었음
        .onChange(of: projectModels) { _, newValue in
            var temp = ["새 프로젝트 생성"]
            temp.append(contentsOf: newValue.map {$0.projectName})
            projectNameOptions = temp
        }
        /// 프로젝트 선택을 변경함
        .onChange(of: selectedProjectName) { _, newValue in
            if newValue == "새 프로젝트 생성" {
                selectedProject = nil
            } else {
                let filtered = projectModels
                    .filter {$0.projectName == newValue} /// 이름으로 프로젝트 모델 서칭 (이름이 유니크해야함)

                if !filtered.isEmpty {
                    selectedProject = filtered[0]
                } else {
                    selectedProject = nil
                }
            }
        }
    }
}

extension MenubarExtraContent {
    @ViewBuilder
    private var sectionProject: some View {
        // 프로젝트의 연습 목록
        VStack(alignment: .leading, spacing: .zero) {
            HStack(spacing: .zero) {
                Text("프로젝트 선택")
                    .systemFont(.caption, weight: .semibold)
                    .foregroundStyle(Color.HPTextStyle.base)
            }
            .padding(.vertical, .HPSpacing.xxsmall)
            .padding(.horizontal, .HPSpacing.small)
            .frame(maxHeight: 45)
            VStack(spacing: .HPSpacing.xsmall) {
                HPMenu(
                    selected: $selectedProjectName,
                    options: $projectNameOptions,
                    maxWidth: .infinity,
                    maxHeight: 27
                )
            }
            .padding(.top, .HPSpacing.xxxxsmall)
            .padding(.bottom, .HPSpacing.xsmall)
            .padding(.horizontal, .HPSpacing.small)
            .frame(maxHeight: .infinity)
        }
        .frame(height: 96, alignment: .topLeading)
        .border(.HPComponent.stroke, width: 1, edges: [.bottom])
        .clipped()
    }
}

#Preview {
    @State
    var selectedProject: ProjectModel? = ProjectModel(
        projectName: "d",
        creatAt: "d",
        keynoteCreation: "dd"
    )
    
    return MenubarExtraContent(selectedProject: $selectedProject)
}
