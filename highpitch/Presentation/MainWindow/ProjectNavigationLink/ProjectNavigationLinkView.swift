//
//  ProjectNavigationLinkView.swift
//  highpitch
//
//  Created by yuncoffee on 10/14/23.
//

import SwiftUI
import SwiftData

struct ProjectNavigationLink: View {
    @Environment(FileSystemManager.self)
    private var fileSystemManager
    @Environment(ProjectManager.self)
    private var projectManager
    @Environment(KeynoteManager.self)
    private var keynoteManager
    //
    @Environment(\.modelContext)
    var modelContext
    
    var body: some View {
        VStack(alignment: .leading, spacing: .HPSpacing.xxsmall) {
            if let projects = projectManager.projects?.reversed() {
                ForEach(projects, id: \.id) { project in
                    ProjectLinkItem(
                        title : project.projectName,
                        isSelected: checkIsSelected(project.id), completion: {
                            if !projectManager.path.isEmpty {
                                projectManager.path.removeLast()
                            }
                            projectManager.current = project
                        }, textFieldCompletion: {edited in
                            project.projectName = edited
                            Task {
                                await MainActor.run {
                                    modelContext.save
                                }
                            }
                        })
                        .contextMenu {
                            Button("Delete") {
                                // 해당 프로젝트 밑에 연습들 경로 하나하나 조회 -> 해당 경로를 통해서 녹음본 삭제
                                Task {
                                    if !projectManager.path.isEmpty {
                                        projectManager.path.removeLast()
                                    }
                                    projectManager.current = nil
                                    await MainActor.run {
                                        for practice in project.practices {
                                            guard let fileURL = practice.audioPath else {
                                                print("[프로젝트 삭제] 연습 음성파일 URL이 nil입니다.")
                                                return
                                            }
                                            let fileManager = FileManager.default
                                            do {
                                                try fileManager.removeItem(at: fileURL)
                                                print("[프로젝트 삭제] 연습 파일 삭제 성공: \(fileURL.path)")
                                            } catch {
                                                print("[프로젝트 삭제] 연습 파일 삭제 실패: \(error.localizedDescription)")
                                            }
                                        }
                                        modelContext.delete(project)
                                    }
                                }
                        
                            }
                            // MARK: [임시] 프로젝트 전체 삭제하는 버튼 (나중에 삭제 가능한 기능)
                            Button("Delete All") {
                                do {
                                    try modelContext.delete(model: ProjectModel.self)
                                } catch {
                                    print("Failed to delete projects.")
                                }
                            }
                        }
                        .padding(.leading, .HPSpacing.xxxsmall)
                        .padding(.trailing, .HPSpacing.xxsmall)
                }
            }
            HPButton(
                type: .blockFill(.HPCornerRadius.medium),
                size: .medium,
                color: .HPPrimary.lightnest
            ) {
                addNewProject()
            } label: { type, size, color, expandable in
                HPLabel(
                    content: ("새 프로젝트 추가", "plus"),
                    type: type,
                    size: size,
                    color: color,
                    alignStyle: .iconWithText,
                    contentColor: .HPPrimary.base, 
                    expandable: expandable, 
                    fontStyle: .systemDetail(.footnote, .semibold)
                )
            }
            .padding(.leading, .HPSpacing.xxxsmall)
            .padding(.trailing, .HPSpacing.xxsmall)

        }
        .padding(.bottom, .HPSpacing.xxlarge)
    }
    
}

extension ProjectNavigationLink {
    func checkIsSelected(_ id: PersistentIdentifier) -> Bool {
        id == projectManager.current?.persistentModelID
    }
    
    private func addNewProject() {
        let newProject = ProjectModel(
            projectName: "\(Date.now.formatted())",
            creatAt: Date.now.formatted(),
            keynotePath: nil,
            keynoteCreation: "temp"
        )
        modelContext.insert(newProject)
        do {
            try modelContext.save()
        } catch {
            print(error)
        }
    }
}

#Preview {
    ProjectNavigationLink()
        .environment(FileSystemManager())
        .environment(ProjectManager())
        .frame(maxWidth: 200)
        .frame(minHeight: 860)
}
