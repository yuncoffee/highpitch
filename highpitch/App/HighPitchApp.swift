//
//  App.swift
//  highpitch
//
//  Created by yuncoffee on 10/10/23.
//

import AppKit
import SwiftUI
import SwiftData
import MenuBarExtraAccess
import SettingsAccess
import HotKey
import Firebase

@main
struct HighpitchApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.openWindow) var openWindow
    
    // MARK: - 데이터 컨트롤을 위한 매니저 객체 선언(전역 싱글 인스턴스)
    @State
    private var mediaManager = MediaManager()
    @State
    private var projectManager = ProjectManager()
#if os(macOS)
    @State
    private var practiceManager = PracticeManager()
    @State
    private var isMenuPresented: Bool = false
    
    @State
    var refreshable = false
    
    @State
    var menubarAnimationCount = 0 {
        didSet {
            if menubarAnimationCount > 6 {
                menubarAnimationCount = 0
            } else if SystemManager.shared.isAnalyzing {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    menubarAnimationCount += 1
                }
            }
        }
    }
#endif
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State
    private var selectedProject: ProjectModel?
    
    @State
    private var systemManager: SystemManager = SystemManager.shared
    
    let container: ModelContainer
    
    init() {
        do {
            #if PREVIEW
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            container = try ModelContainer(for: ProjectModel.self, configurations: config)
            // ************************************* //
            let project = ProjectMock.shared.sampleProject
            let practice1 = SampleDigDaPracticesMock1.shared.practice
            let practice2 = SampleDigDaPracticesMock2.shared.practice
            let practice3 = SampleDigDaPracticesMock3.shared.practice
            let practice4 = SampleDigDaPracticesMock4.shared.practice
            let practice5 = SampleDigDaPracticesMock5.shared.practice
            let practice6 = SampleDigDaPracticesMock6.shared.practice
            let practice7 = SampleDigDaPracticesMock7.shared.practice
            // ************************************* //
            container.mainContext.insert(project)
            container.mainContext.insert(practice1)
            container.mainContext.insert(practice2)
            container.mainContext.insert(practice3)
            container.mainContext.insert(practice4)
            container.mainContext.insert(practice5)
            container.mainContext.insert(practice6)
            container.mainContext.insert(practice7)
            // ************************************* //
            practice1.summary = SampleDigDaPracticesMock1.shared.summary
            practice1.summary.maxSpm = 480.0
            practice1.summary.minSpm = 370.0
            practice1.summary.fwpm = 5.7
            practice1.utterances = SampleDigDaPracticesMock2.shared.utterance
            practice1.words = SampleDigDaPracticesMock2.shared.words
            practice1.sentences = SampleDigDaPracticesMock2.shared.sentences
            project.practices.append(practice1)
            // ************************************* //
            practice2.summary = SampleDigDaPracticesMock2.shared.summary
            practice2.summary.maxSpm = 450.0
            practice2.summary.minSpm = 350.0
            practice2.summary.fwpm = 5.2
            practice2.utterances = SampleDigDaPracticesMock2.shared.utterance
            practice2.words = SampleDigDaPracticesMock2.shared.words
            practice2.sentences = SampleDigDaPracticesMock2.shared.sentences
            project.practices.append(practice2)
            // ************************************* //
            practice3.summary = SampleDigDaPracticesMock3.shared.summary
            practice3.summary.maxSpm = 380.0
            practice3.summary.minSpm = 320.0
            practice3.summary.fwpm = 4.0
            practice3.utterances = SampleDigDaPracticesMock3.shared.utterance
            practice3.words = SampleDigDaPracticesMock3.shared.words
            practice3.sentences = SampleDigDaPracticesMock3.shared.sentences
            project.practices.append(practice3)
            // ************************************* //
            practice4.summary = SampleDigDaPracticesMock4.shared.summary
            practice4.summary.maxSpm = 370.0
            practice4.summary.minSpm = 260.0
            practice4.summary.fwpm = 3.2222
            practice4.utterances = SampleDigDaPracticesMock4.shared.utterance
            practice4.words = SampleDigDaPracticesMock4.shared.words
            practice4.sentences = SampleDigDaPracticesMock4.shared.sentences
            project.practices.append(practice4)
            // ************************************* //
            practice5.summary = SampleDigDaPracticesMock5.shared.summary
            practice5.summary.maxSpm = 350.0
            practice5.summary.minSpm = 270.0
            practice5.summary.fwpm = 2.5
            practice5.utterances = SampleDigDaPracticesMock5.shared.utterance
            practice5.words = SampleDigDaPracticesMock5.shared.words
            practice5.sentences = SampleDigDaPracticesMock5.shared.sentences
            project.practices.append(practice5)
            // ************************************* //
            practice6.summary = SampleDigDaPracticesMock6.shared.summary
            practice6.summary.maxSpm = 350.0
            practice6.summary.minSpm = 220.0
            practice6.summary.fwpm = 1.5
            practice6.utterances = SampleDigDaPracticesMock6.shared.utterance
            practice6.words = SampleDigDaPracticesMock6.shared.words
            practice6.sentences = SampleDigDaPracticesMock6.shared.sentences
            project.practices.append(practice6)
            // ************************************* //
            practice7.summary = SampleDigDaPracticesMock7.shared.summary
            practice7.summary.maxSpm = 340.0
            practice7.summary.minSpm = 230.0
            practice7.summary.fwpm = 1.00
            practice7.utterances = SampleDigDaPracticesMock7.shared.utterance
            practice7.words = SampleDigDaPracticesMock7.shared.words
            practice7.sentences = SampleDigDaPracticesMock7.shared.sentences
            project.practices.append(practice7)
            
//            container.mainContext.insert(SampleDigDaPracticesMock1.shared.practice)
            #endif
            #if DEBUG
            let storeURL = URL.getStorePath(fileName: "database.sqlite")
//            let storeURL = URL.getStorePath(fileName: "sample.sqlite")
            let config = ModelConfiguration(url: storeURL)
            container = try ModelContainer(
                for: ProjectModel.self,
                configurations: config)
            #endif
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
        if UserDefaults.standard.string(forKey: "recordStartCommand") == nil {
            UserDefaults.standard.set("Command + Control + P", forKey: "recordStartCommand")
        }
        if UserDefaults.standard.string(forKey: "recordPauseCommand") == nil {
            UserDefaults.standard.set("Command + Control + Space", forKey: "recordPauseCommand")
        }
        if UserDefaults.standard.string(forKey: "recordSaveCommand") == nil {
            UserDefaults.standard.set("Command + Control + Esc", forKey: "recordSaveCommand")
        }
        // UserDefaults에서 명령어조합 가져와서 hotKey로 세팅. 초기 함수 연결은 onAppear에서 한다.
        systemManager.hotkeyStart = stringToHotKeySetting(input: systemManager.recordStartCommand)
        systemManager.hotkeyPause = stringToHotKeySetting(input: systemManager.recordPauseCommand)
        systemManager.hotkeySave = stringToHotKeySetting(input: systemManager.recordSaveCommand)
        systemManager.playPractice = playPractice
        systemManager.pausePractice = pausePractice
        systemManager.stopPractice = stopPractice
        systemManager.notSavePractice = notSavePractice
        #if DEBUG
        print("시작할때 Start 키콤보: ",systemManager.hotkeyStart.keyCombo)
        print("시작할때 Pause 키콤보: ",systemManager.hotkeyPause.keyCombo)
        print("시작할때 Save 키콤보: ",systemManager.hotkeySave.keyCombo)
        #endif
    }
    
    var body: some Scene {
#if os(macOS)
        Window("mainwindow", id: "main") {
            if SystemManager.shared.isPassOnbarding {
                MainWindowView(currentSelectedProject: $selectedProject)
                    .environment(practiceManager)
                    .environment(mediaManager)
                    .environment(projectManager)
                    .environment(selectedProject)
                    .modelContainer(container)
                    .openSettingsAccess()
                    .onChange(of: systemManager.recordStartCommand, { _, _ in
                        // 변경된 명령어들로 hotKey재설정
                        systemManager.hotkeyStart = stringToHotKeySetting(input: systemManager.recordStartCommand)
                        systemManager.hotkeyStart.keyDownHandler = playPractice
                        
                        // UserDefaults에 해당 명령어들로 저장
                        UserDefaults.standard.setValue(
                            systemManager.recordStartCommand,
                            forKey: "recordStartCommand"
                        )
                    })
                    .onChange(of: systemManager.recordPauseCommand, { _, _ in
                        // 변경된 명령어들로 hotKey재설정
                        systemManager.hotkeyPause = stringToHotKeySetting(input: systemManager.recordPauseCommand)
                        systemManager.hotkeyPause.keyDownHandler = pausePractice
                        
                        // UserDefaults에 해당 명령어들로 저장
                        UserDefaults.standard.setValue(
                            systemManager.recordPauseCommand,
                            forKey: "recordPauseCommand"
                        )
                    })
                    .onChange(of: systemManager.recordSaveCommand, { _, _ in
                        // 변경된 명령어들로 hotKey재설정
                        systemManager.hotkeySave = stringToHotKeySetting(input: systemManager.recordSaveCommand)
                        systemManager.hotkeySave.keyDownHandler = stopPractice
                        
                        // UserDefaults에 해당 명령어들로 저장
                        UserDefaults.standard.setValue(
                            systemManager.recordSaveCommand,
                            forKey: "recordSaveCommand"
                        )
                    })
                    .onAppear {
                        systemManager.hotkeyStart.keyDownHandler = playPractice
                        systemManager.hotkeyPause.keyDownHandler = pausePractice
                        systemManager.hotkeySave.keyDownHandler = stopPractice
                    }
                // Panel들 관리: isDetailSettingActive가 true로 변경 시, 상세설정 Panel 띄워준다.
                    .onChange(of: systemManager.instantFeedbackManager.isDetailSettingActive) { _, activeOn in
                        if activeOn {
                            appDelegate.panelControllers[InstantPanel.detailSetting]?.showPanel(self)
                        } else {
                            appDelegate.panelControllers[InstantPanel.detailSetting]?.hidePanel(self)
                        }
                    }
                // Panel들 관리: 활성화된 Panel은 화면에 띄워지고, 비활성화 Panel들은 화면에서 숨긴다.
                    .onChange(of: systemManager.instantFeedbackManager.activePanels) { hidePanels, showPanels in
                        for hidePanel in hidePanels {
                            appDelegate.panelControllers[hidePanel]?.hidePanel(self)
                        }
                        for showPanel in showPanels {
                            appDelegate.panelControllers[showPanel]?.showPanel(self)
                        }
                    }
            } else {
                OnboardingView()
                    .environment(mediaManager)
                    .frame(width: 1000, height: 628)
                    .onAppear {
                        NSApp.windows.forEach { window in
                            window.standardWindowButton(.miniaturizeButton)?.isEnabled = false
                            window.standardWindowButton(.zoomButton)?.isEnabled = false
                        }
                    }
                    .onDisappear {
                        NSApp.windows.forEach { window in
                            window.standardWindowButton(.miniaturizeButton)?.isEnabled = true
                            window.standardWindowButton(.zoomButton)?.isEnabled = true
                        }
                    }
            }
        }
        .defaultSize(width: 1000, height: 628)
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
        // MARK: - Settings Scene
        Settings {
            SettingsView()
                .environment(mediaManager)
                .modelContainer(container)
        }
        .windowResizability(.contentSize)
        // MARK: - MenubarExtra Scene
        MenuBarExtra {
            MenubarExtraView(
                refreshable: $refreshable,
                selectedProject: $selectedProject
            )
            .environment(mediaManager)
            .environment(projectManager)
            .openSettingsAccess()
            .modelContainer(container)
            .introspectMenuBarExtraWindow { window in
                window.animationBehavior = .utilityWindow
            }
        } label: {
            if SystemManager.shared.isAnalyzing {
                Label("MenubarExtra", image: "menubar-loading-light-\(menubarAnimationCount)")
            } else if SystemManager.shared.hasUnVisited {
                Image("menubar-noti")
                    .renderingMode(.template)
                    .foregroundStyle(.red, .blendMode(.overlay))
            } else {
                Label("MenubarExtra", image: "menubarextra")
            }
        }
        .menuBarExtraStyle(.window)
        .menuBarExtraAccess(isPresented: $isMenuPresented)
        .commandsRemoved()
        .onChange(of: isMenuPresented, { _, newValue in
            if newValue {
                GAManager.shared.analyticsOnClick(.menubarClick)
            }
            refreshable = newValue
        })
        .onChange(of: mediaManager.isStart, { _, newValue in
            if newValue {
                Task {
                    await MainActor.run {
                        isMenuPresented = false
                    }
                }
            }
        })
        .onChange(of: mediaManager.isRecording, { _, newValue in
            if !newValue {
                menubarAnimationCount += 1
            }
        })
#endif
    }
}
extension HighpitchApp {
    private func setupInit() {

    }
    
    func playPractice() {
        projectManager.playPractice(
            selectedProject: selectedProject,
            mediaManager: mediaManager
        )
    }
    
    func pausePractice() {
        projectManager.pausePractice(mediaManager: mediaManager)
    }
    
    func stopPractice() {
        Task {
            await MainActor.run {
                projectManager.stopPractice(
                    mediaManager: mediaManager,
                    modelContext: container.mainContext
                )
            }
        }
    }
    
    func notSavePractice() {
        Task {
            await MainActor.run {
                projectManager.notSavePractice(
                    mediaManager: mediaManager,
                    modelContext: container.mainContext
                )
            }
        }
    }
    
    func stringToHotKeySetting(input: String) -> HotKey {
        
        let keyMap: [String : Key] =
        ["1":Key.one, "2":Key.two, "3":Key.three, "4":Key.four, "5":Key.five,
         "6":Key.six, "7":Key.seven, "8":Key.eight, "9":Key.nine, "0":Key.zero,
         "Q":Key.q, "W":Key.w, "E":Key.e, "R":Key.r, "T":Key.t,
         "Y":Key.y, "U":Key.u, "I":Key.i, "O":Key.o, "P":Key.p,
         "A":Key.a, "S":Key.s, "D":Key.d, "F":Key.f, "G":Key.g,
         "H":Key.h, "J":Key.j, "K":Key.k, "L":Key.l, "Z":Key.z,
         "X":Key.x, "C":Key.c, "V":Key.v, "B":Key.b, "N":Key.n,
         "M":Key.m, "Esc": Key.escape, "Space":Key.space]
        
        let tempArray = input.split(separator: "+").map { String($0.trimmingCharacters(in: .whitespaces)) }
        
        let tempKey: Key = keyMap[tempArray.last!] ?? Key.escape
        var tempModifiers = NSEvent.modifierFlags
        for index in 0..<tempArray.count - 1 {
            if tempArray[index] == "Command" {
                tempModifiers.insert(.command)
            } else if tempArray[index] == "Control" {
                tempModifiers.insert(.control)
            } else if tempArray[index] == "Option" {
                tempModifiers.insert(.option)
            } else if tempArray[index] == "Shift" {
                tempModifiers.insert(.shift)
            }
        }
        
        return HotKey(key: tempKey, modifiers: tempModifiers)
    }
}
