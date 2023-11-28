//
//  ProjectNavigationLinkView.swift
//  highpitch
//
//  Created by yuncoffee on 10/14/23.
//

import SwiftUI
import SwiftData

struct ProjectNavigationLink: View {
    @Environment(ProjectManager.self)
    private var projectManager
    @Environment(\.modelContext)
    var modelContext
    var focusField: FocusState<String?>.Binding
    @Binding
    var addedProjectID: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: .HPSpacing.xxsmall) {
            if let projects = projectManager.projects?.reversed() {
                VStack(spacing: .HPSpacing.xxxsmall) {
                    ForEach(projects, id: \.id) { project in
                        if project.creatAt == addedProjectID {
                            ProjectLinkItem(
                                title : project.projectName,
                                isSelected: checkIsSelected(project.id),
                                completion: {
                                    if !projectManager.path.isEmpty {
                                        projectManager.path.removeLast()
                                    }
                                    projectManager.current = project
                                }, textFieldCompletion: { edited in
                                    project.projectName = edited
                                    Task {
                                        await MainActor.run {
                                            modelContext.save
                                        }
                                    }
                                },
                                focusField: focusField,
                                isEditModeActive: true,
                                addedProjectID: $addedProjectID
                            )
                                .contextMenu {
                                    Button("Delete") {
                                        addedProjectID = nil
                                        // 해당 프로젝트 밑에 연습들 경로 하나하나 조회 -> 해당 경로를 통해서 녹음본 삭제
                                        Task {
                                            if !projectManager.path.isEmpty {
                                                projectManager.path.removeLast()
                                            }
                                            projectManager.current = nil
                                            await MainActor.run {
                                                for practice in project.practices {
                                                    guard let fileURL = practice.audioPath else {
                                                        #if DEBUG
                                                        print("[프로젝트 삭제] 연습 음성파일 URL이 nil입니다.")
                                                        #endif
                                                        
                                                        return
                                                    }
                                                    let fileManager = FileManager.default
                                                    do {
                                                        try fileManager.removeItem(at: fileURL)
                                                        #if DEBUG
                                                        print("[프로젝트 삭제] 연습 파일 삭제 성공: \(fileURL.path)")
                                                        #endif
                                                    } catch {
                                                        #if DEBUG
                                                        print("[프로젝트 삭제] 연습 파일 삭제 실패: \(error.localizedDescription)")
                                                        #endif
                                                    }
                                                }
                                                modelContext.autosaveEnabled = true
                                                modelContext.delete(project)
                                            }
                                        }
                                
                                    }
                                    // MARK: [임시] 프로젝트 전체 삭제하는 버튼 (나중에 삭제 가능한 기능)
                                    Button("Delete All") {
                                        do {
                                            try modelContext.delete(model: ProjectModel.self)
                                        } catch {
                                            #if DEBUG
                                            print("Failed to delete projects.")
                                            #endif
                                        }
                                    }
                                }
                                .padding(.horizontal, .HPSpacing.xxxsmall)
                        } else {
                            ProjectLinkItem(
                                title : project.projectName,
                                isSelected: checkIsSelected(project.id),
                                completion: {
                                    if !projectManager.path.isEmpty {
                                        projectManager.path.removeLast()
                                    }
                                    projectManager.current = project
                                }, textFieldCompletion: { edited in
                                    project.projectName = edited
                                    Task {
                                        await MainActor.run {
                                            modelContext.save
                                        }
                                    }
                                },
                                focusField: focusField,
                                addedProjectID: $addedProjectID
                            )
                                .contextMenu {
                                    Button("Delete") {
                                        addedProjectID = nil
                                        // 해당 프로젝트 밑에 연습들 경로 하나하나 조회 -> 해당 경로를 통해서 녹음본 삭제
                                        Task {
                                            if !projectManager.path.isEmpty {
                                                projectManager.path.removeLast()
                                            }
                                            projectManager.current = nil
                                            await MainActor.run {
                                                for practice in project.practices {
                                                    guard let fileURL = practice.audioPath else {
                                                        #if DEBUG
                                                        print("[프로젝트 삭제] 연습 음성파일 URL이 nil입니다.")
                                                        #endif
                                                        return
                                                    }
                                                    let fileManager = FileManager.default
                                                    do {
                                                        try fileManager.removeItem(at: fileURL)
                                                        #if DEBUG
                                                        print("[프로젝트 삭제] 연습 파일 삭제 성공: \(fileURL.path)")
                                                        #endif
                                                    } catch {
                                                        #if DEBUG
                                                        print("[프로젝트 삭제] 연습 파일 삭제 실패: \(error.localizedDescription)")
                                                        #endif
                                                    }
                                                }
                                                print("Delete할 project: \(project.projectName)")
                                                modelContext.delete(project)
                                                try? modelContext.save()
                                            }
                                        }
                                
                                    }
                                    // MARK: [임시] 프로젝트 전체 삭제하는 버튼 (나중에 삭제 가능한 기능)
                                    Button("Delete All") {
                                        do {
                                            try modelContext.delete(model: ProjectModel.self)
                                        } catch {
                                            #if DEBUG
                                            print("Failed to delete projects.")
                                            #endif
                                        }
                                    }
                                }
                                .padding(.horizontal, .HPSpacing.xxxsmall)
                        }
                        
                    }
                }
                .padding(.top, 1)
            }
        }
        .padding(.bottom, .HPSpacing.xxlarge)
    }
}

extension ProjectNavigationLink {
    func checkIsSelected(_ id: PersistentIdentifier) -> Bool {
        id == projectManager.current?.persistentModelID
    }
}

// #Preview {
//    ProjectNavigationLink()
//        .environment(ProjectManager())
//        .frame(maxWidth: 200)
//        .frame(minHeight: 860)
// }
