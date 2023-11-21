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
            let storeURL = URL.getStorePath(fileName: "database.sqlite")
            let config = ModelConfiguration(url: storeURL)
            container = try ModelContainer(
                for: ProjectModel.self,
                configurations: config)
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
        // MARK: - 테스트
        systemManager.stopPractice = stopPractice
        print("시작할때 Start 키콤보: ",systemManager.hotkeyStart.keyCombo)
        print("시작할때 Pause 키콤보: ",systemManager.hotkeyPause.keyCombo)
        print("시작할때 Save 키콤보: ",systemManager.hotkeySave.keyCombo)
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
            print(isMenuPresented)
            if newValue {
                GAManager.shared.analyticsOnClick(.menubarClick)
            }
            refreshable = newValue
        })
        .onChange(of: mediaManager.isRecording, { _, newValue in
            print("TEST!!!!")
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
    
    func stringToHotKeySetting(input: String) -> HotKey {
        
        var keyMap: [String : Key] =
        ["1":Key.one, "2":Key.two, "3":Key.three, "4":Key.four, "5":Key.five,
         "6":Key.six, "7":Key.seven, "8":Key.eight, "9":Key.nine, "0":Key.zero,
         "Q":Key.q, "W":Key.w, "E":Key.e, "R":Key.r, "T":Key.t,
         "Y":Key.y, "U":Key.u, "I":Key.i, "O":Key.o, "P":Key.p,
         "A":Key.a, "S":Key.s, "D":Key.d, "F":Key.f, "G":Key.g,
         "H":Key.h, "J":Key.j, "K":Key.k, "L":Key.l, "Z":Key.z,
         "X":Key.x, "C":Key.c, "V":Key.v, "B":Key.b, "N":Key.n,
         "M":Key.m, "Esc": Key.escape, "Space":Key.space]
        
        var tempArray = input.split(separator: "+").map { String($0.trimmingCharacters(in: .whitespaces)) }
        
        var tempKey: Key = keyMap[tempArray.last!] ?? Key.escape
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
