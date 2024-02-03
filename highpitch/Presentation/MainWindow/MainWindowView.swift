//
//  MainWindowView.swift
//  highpitch
//
//  Created by yuncoffee on 10/10/23.
//

#if os(macOS)
import SwiftUI
import SwiftData
import UserNotifications

struct MainWindowView: View {
    // MARK: - 데이터 컨트롤을 위한 매니저 객체
    @Environment(MediaManager.self)
    private var mediaManager
    @Environment(ProjectManager.self)
    private var projectManager
    @Environment(\.openSettings)
    private var openSettings
    @Environment(\.colorScheme) var colorScheme
    // MARK: - 데이터 저장을 위한 컨텍스트 객체
    @Environment(\.modelContext)
    var modelContext
    @Environment(ProjectModel.self)
    var selectedProject: ProjectModel?
    @Query(sort: \ProjectModel.creatAt)
    var projects: [ProjectModel]
    
    @Query(
        filter: #Predicate<PracticeModel> { !$0.isVisited },
        sort: \PracticeModel.creatAt,
        order: .reverse)
    var unVisitedPractices: [PracticeModel] = []
    
    @State
    private var columnVisibility = NavigationSplitViewVisibility.all

    @ObservedObject var notiManager = NotificationManager.shared
    
    @State
    private var localProjectName = ""
    
    @State
    private var isAlertActive = false
    
    @FocusState
    var focusField: String?
    
    @State
    private var addedProjectID: String?
    
    private var selected: ProjectModel? {
        projectManager.current
    }
    
    @Binding
    var currentSelectedProject: ProjectModel?
    
    var body: some View {
        @Bindable var systemManager = SystemManager.shared
        @Bindable var mediaManager = mediaManager
        @Bindable var projectManager = projectManager
        NavigationSplitView(columnVisibility: $columnVisibility) {
            navigationSidebar
        } detail: {
            navigationDetails
        }
        .toolbarBackground(.hidden)
        .navigationTitle("Sidebar")
        // MARK: - ContentSize 조정 시 특이사항, maxWidth가 디스플레이 사이즈를 넘어갈 시 FullScreenMode가 활성화된다.
        .frame(
            minWidth: 1000,
            maxWidth: 1511,
            minHeight: 600,
            maxHeight: .infinity
        )
        .background(Color.HPComponent.Sidebar.background)
        .onAppear {
            NotificationManager.shared.requestAuthorization()
            checkAudioPermission()
            receiveNotificationAndRouting()
            setup()
        }
        .onChange(of: colorScheme, { _, newValue in
            if newValue == ColorScheme.dark {
                SystemManager.shared.isDarkMode = true
            } else {
                SystemManager.shared.isDarkMode = false
            }
        })
        .onChange(of: projects) { _, newValue in
            projectManager.projects = newValue
            if !newValue.isEmpty {
                projectManager.current = newValue.last
            }
        }
        .onChange(of: projectManager.current) { _, newValue in
            if let currnet = newValue {
                localProjectName = currnet.projectName
            }
        }
        .sheet(isPresented: $systemManager.isRequsetAudioPermissionPopoverActive) {
            RequestAudioPermissionPopover()
        }
        .sheet(isPresented: $systemManager.isMainWindowPracticeSaveSheetActive) {
            MainWindowPracticeSaveSheet()
        }
        .sheet(isPresented: $mediaManager.isStart, content: {
            ScreenSelectionView()
        })
        .sheet(isPresented: $projectManager.isMicRecordpermitted, content: {
            RequestMicView()
        })
        .sheet(isPresented: $mediaManager.isDictationUnavailable, content: {
            RequestDictationView()
        })
        .sheet(isPresented: $projectManager.isScreenRecordpermitted, content: {
            RequestScreenPermissionView()
        })

    }
}

extension MainWindowView {
    private func setup() {
//        UserDefaults.standard.set(false, forKey: "isPassOnbarding")
        if !unVisitedPractices.isEmpty {
            SystemManager.shared.hasUnVisited = true
        }
        if !projects.isEmpty {
            projectManager.projects = projects
            projectManager.current = projects.last
        }
        if colorScheme == ColorScheme.dark {
            SystemManager.shared.isDarkMode = true
        } else {
            SystemManager.shared.isDarkMode = false
        }
        // MARK: 노티피케이션 삭제
        UNUserNotificationCenter.current().setBadgeCount(0)
    }
    private func checkAudioPermission() {
        if(!mediaManager.checkMicrophonePermission()) {
            SystemManager.shared.isRequsetAudioPermissionPopoverActive = true
        }
    }
    private func receiveNotificationAndRouting() {
        NotificationCenter.default.addObserver(forName: Notification.Name("projectName"),
                                               object: nil, queue: nil) { value in
            let thisPractice = projects.flatMap { $0.practices }
                .first(where: { $0.creatAt == value.object as! String })
            if let practice = thisPractice {
                projectManager.currentTabItem = 1
                if !projectManager.path.isEmpty {
                  projectManager.path.removeLast()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                  projectManager.path.append(practice)
                }
            }
        }
    }
}

// MARK: - Views

extension MainWindowView {
    // MARK: - navigationSidebar
    @ViewBuilder
    var navigationSidebar: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                var transaction = Transaction()
                transaction.disablesAnimations = true
                withTransaction(transaction) {
                    if !projectManager.path.isEmpty {
                        projectManager.path.removeLast()
                    }
                    projectManager.current = nil
                }
            } label: {
                Text("내 연습 분석")
                    .systemFont(
                        .footnote,
                        weight: projectManager.current == nil ? .bold : .semibold)
                    .foregroundStyle(
                        projectManager.current == nil 
                        ? Color.HPTextStyle.darker
                        : Color.HPTextStyle.base
                    )
                    .frame(maxWidth: .infinity, minHeight: 36, alignment: .leading)
                    .padding(.horizontal, .HPSpacing.xxxsmall)
                    .background(
                        projectManager.current == nil
                        ? Color.HPComponent.Sidebar.select
                        : Color.clear
                    )
                    .cornerRadius(7)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .padding(.horizontal, .HPSpacing.xxxsmall)
            .padding(.top, .HPSpacing.xxxsmall)
            Divider()
                .background(Color.HPComponent.stroke)
                .opacity(0.5)
                .padding(.top, .HPSpacing.xxxsmall)
                .padding(.bottom, .HPSpacing.small)
                .padding(.horizontal, .HPSpacing.xxsmall)
            HStack(alignment: .center) {
                Text("내 프로젝트")
                    .systemFont(.footnote, weight: .semibold)
                    .foregroundStyle(Color.HPTextStyle.base)
                    .padding(.leading, .HPSpacing.xsmall)
                    #if DEBUG
                    .onTapGesture {
                        if (SystemManager.shared.isRecognizing) {
                            SystemManager.shared.stopInstantFeedback()
                        } else {
                            SystemManager.shared.startInstantFeedback()
                        }
                    }
                    #endif
                Spacer()
                Button {
                    addNewProject()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.HPPrimary.dark)
                        .frame(height: 14)
                }
                .buttonStyle(.plain)
                .padding(.trailing, .HPSpacing.xsmall)
            }
            .frame(height: .HPSpacing.small)
            .padding(.bottom, 14)
            ScrollView {
                LazyVGrid(columns: [GridItem()], alignment: .leading) {
                    ProjectNavigationLink(
                        focusField: $focusField,
                        addedProjectID: $addedProjectID
                    )
                }
            }
            Spacer()
            Button {
                try? openSettings()
            } label: {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(Color.HPGray.system600)
                    .padding(.leading, .HPSpacing.xxsmall + .HPSpacing.xsmall)
                    .padding(.bottom, .HPSpacing.medium)
            }
            .buttonStyle(.plain)
        }
        .frame(alignment: .topLeading)
        .navigationSplitViewColumnWidth(200)
        .padding(.top, .HPSpacing.xsmall)
        .background(
            Color.HPComponent.Sidebar.background)
    }
    
    // MARK: - navigationDetails
    @ViewBuilder
    var navigationDetails: some View {
        if selected != nil {
            VStack(alignment: .leading, spacing: 0) {
                projectToolbar
                VStack {
                    ProjectView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.HPComponent.Detail.background)
            .ignoresSafeArea()
        } else {
            VStack(alignment: .leading, spacing: 0) {
                projectToolbar
                VStack {
                    PracticeAnalysisView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.HPComponent.Detail.background)
            .ignoresSafeArea()
        }
    }
    
    // MARK: - emptyProject
    @ViewBuilder
    var emptyProject: some View {
        VStack {
            Text("선택된 프로젝트가 없습니다.")
        }
    }
    
    // MARK: - projectToolbar
    @ViewBuilder
    var projectToolbar: some View {
        if let projectName = projectManager.current?.projectName {
            HPTopToolbar(title: projectName, completion: {
                HPButton(color: .HPSecondary.base) {
                    Task {
                        do {
                            if mediaManager.checkMicrophonePermission() {
                                projectManager.isMicRecordpermitted = false
                            } else {
                                projectManager.isMicRecordpermitted = true
                                return
                            }
                            if await ScreenRecordManager.canRecord {
                                projectManager.isScreenRecordpermitted = false
                            } else {
                                projectManager.isScreenRecordpermitted = true
                                return
                            }
                            let available = try await SpeechRecognizerManager().isSpeechAvailable()
                            if available {
                                mediaManager.isDictationUnavailable = false
                                mediaManager.isStart = true
                                // MARK: - 현재 프로젝트로 설정하는 부분에 문제가 있는가?
                                if let currentProject = projectManager.current {
                                    currentSelectedProject = currentProject
                                }
                            } else {
                                mediaManager.isDictationUnavailable = true
                                return
                            }
                        } catch { }
                    }
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: (label: "연습 시작하기", icon: nil),
                        type: type,
                        size: size,
                        color: color,
                        expandable: expandable,
                        fontStyle: .system(.footnote)
                    )
                }
                .frame(width: 120)
                .padding(.trailing, .HPSpacing.medium)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .disabled(mediaManager.isRecording)
            }, popOverContent: {
                VStack(alignment: .leading, spacing: .HPSpacing.xxxxsmall) {
                    Text("프로젝트 명 변경하기")
                        .systemFont(.caption2)
                    VStack(spacing: .HPSpacing.xxxxsmall) {
                        TextField("set your ProjectName", text: $localProjectName)
                            .systemFont(.caption)
                        Button(action: {
                            projectManager.current?.projectName = localProjectName
                            #if DEBUG
                            print("projectName: \(localProjectName)")
                            #endif
                            Task {
                                await MainActor.run {
                                    do {
                                        try modelContext.save()
                                    } catch {
                                        #if DEBUG
                                        print("error: 변경 실패")
                                        #endif
                                    }
                                }
                            }
                        }, label: {
                            Text("변경하기")
                        })
                    }
                }
                .padding(.vertical, .HPSpacing.xxxsmall)
                .padding(.horizontal, .HPSpacing.xsmall)
                .frame(minWidth: 200)
                .onAppear(perform: {
                    localProjectName = projectName
                })
                .onDisappear {
                    localProjectName = projectName
                }
            })
        } else {
            HPTopToolbar(title: "내 연습 분석") {
                HPButton(color: .HPSecondary.base) {
                    Task {
                        do {
                            if mediaManager.checkMicrophonePermission() {
                                projectManager.isMicRecordpermitted = false
                            } else {
                                projectManager.isMicRecordpermitted = true
                                return
                            }
                            if await ScreenRecordManager.canRecord {
                                projectManager.isScreenRecordpermitted = false
                            } else {
                                projectManager.isScreenRecordpermitted = true
                                return
                            }
                            let available = try await SpeechRecognizerManager().isSpeechAvailable()
                            if available {
                                mediaManager.isDictationUnavailable = false
                                mediaManager.isStart = true
                            } else {
                                mediaManager.isDictationUnavailable = true
                            }
                        } catch { }
                    }
                } label: { type, size, color, expandable in
                    HPLabel(
                        content: (label: "연습 시작하기", icon: nil),
                        type: type,
                        size: size,
                        color: color,
                        expandable: expandable,
                        fontStyle: .system(.footnote)
                    )
                }
                .frame(width: 120)
                .padding(.trailing, .HPSpacing.medium)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .disabled(mediaManager.isRecording)
            }
        }
    }
}

extension MainWindowView {
    
    private func addNewProject() {
        let newProject = ProjectModel(
            projectName: "\(Date.now.formatted())",
            creatAt: Date.now.formatted(),
            keynotePath: nil,
            keynoteCreation: "temp"
        )
        addedProjectID = newProject.creatAt
        modelContext.insert(newProject)
        do {
            try modelContext.save()
        } catch {
            #if DEBUG
            print(error)
            #endif
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            focusField = newProject.creatAt
        }
    }
}

#Preview {
    @State
    var selectedProject: ProjectModel?
    
    return MainWindowView(currentSelectedProject: $selectedProject)
        .environment(MediaManager())
        .environment(ProjectManager())
}
#endif
