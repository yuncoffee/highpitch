//
//  ProjectManager.swift
//  highpitch
//
//  Created by yuncoffee on 10/14/23.
//

import Foundation
import SwiftUI
import SwiftData
import AVFoundation

@Observable
final class ProjectManager {
    // MARK: - 임시 샘플 프로젝트들 저장
    var projects: [ProjectModel]?
    var current: ProjectModel?
    var temp: PersistentIdentifier?
    var currentTabItem = 1
    var path: NavigationPath = .init()
    var isEndClicked = false
    var isScreenRecordpermitted = false
    var isMicRecordpermitted = false
    
}

extension ProjectManager {
    // MARK: 연습 시작하기
    func playPractice(
        selectedProject: ProjectModel?,
        mediaManager: MediaManager
    ) {
        if(mediaManager.checkMicrophonePermission()) {
            if mediaManager.isRecording {
                mediaManager.startRecording()
            } else {
                temp = selectedProject?.persistentModelID
                mediaManager.fileName = Date().makeM4aFileName()
                mediaManager.startRecording()
            }
        } else {
            SystemManager.shared.isRequsetAudioPermissionPopoverActive = true
        }
    }
    
    func pausePractice(mediaManager: MediaManager) {
        mediaManager.pauseRecording()
    }
    
    @MainActor
    func stopPractice(
        mediaManager: MediaManager,
        modelContext: ModelContext
    ) {
        if !mediaManager.isRecording {
            return
        }
        #if DEBUG
        print("녹음 종료")
        #endif
        mediaManager.stopRecording()
        SystemManager.shared.isAnalyzing = true
        /// mediaManager.fileName에 음성 파일이 저장되어있을거다!!
        /// 녹음본 파일 위치 : /Users/{사용자이름}/Documents/HighPitch/Audio.YYYYMMDDHHMMSS.m4a
        /// ReturnZero API를 이용해서 UtteranceModel완성
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
            Task { [self] in
                let newUtteranceModels = await self.makeNewUtterancesV2(mediaManager: mediaManager)
                /// 아무말도 하지 않았을 경우 종료한다.
                // MARK: - 아무말도 하지 않았을 경우 피드백 필요
                if newUtteranceModels.isEmpty {
                    #if DEBUG
                    print("none of words!")
                    #endif
                    SystemManager.shared.isAnalyzing = false
                    return
                }
                /// 시작할 때 프로젝트 세팅이 안되어 있을 경우, 새 프로젝트를 생성 하고, temp에 반영한다.
                /// temp는 새로 만들어진 ProjectModel.persistentModelID 을 들고 있다.
                if self.temp == nil {
                    self.makeNewProject(modelContext: modelContext)
                }
                /// 생성한 ID로 프로젝트 모델을 가져온다.
                guard let id = self.temp else { return }
                guard let tempProject = modelContext.model(for: id) as? ProjectModel else { return }
                let newPracticeModel = self.makeNewPractice(
                    project: tempProject,
                    utterances: newUtteranceModels,
                    mediaManager: mediaManager
                )
                /// 프로젝트에 추가한다.
                tempProject.practices.append(newPracticeModel)
                do {
                    let audioPlayer = try AVAudioPlayer(contentsOf: URL(
                        fileURLWithPath: URL.getPath(fileName: mediaManager.fileName,type: .audio
                    ).path()))
                    newPracticeModel.summary.practiceLength = audioPlayer.duration
                    #if DEBUG
                    print("길이: ", audioPlayer.duration)
                    #endif
                    
                } catch {
                    #if DEBUG
                    print("오디오 플레이어를 생성하는 중 오류 발생: \(error.localizedDescription)")
                    #endif
                }
                /// words, sentences, summary를 처리한다.
                PracticeManager.getPracticeDetail(practice: newPracticeModel)
                self.temp = nil
                if self.current == nil {
                    self.current = tempProject
                }
                NotificationManager.shared.sendNotification(
                    name: newPracticeModel.creatAt
                )
            }
        }
    }
    
    @MainActor
    func notSavePractice(
        mediaManager: MediaManager,
        modelContext: ModelContext
    ) {
        if !mediaManager.isRecording {
            return
        }
        #if DEBUG
        print("녹음 종료")
        #endif
        mediaManager.stopRecording()
        SystemManager.shared.isAnalyzing = false
        return
    }
    
    private func makeNewUtterances(mediaManager: MediaManager) async -> [UtteranceModel] {
        var result: [UtteranceModel] = []
        do {
            let tempUtterances: [Utterance] = try await ReturnzeroAPIV2()
                .getResult(filePath: URL.getPath(fileName: mediaManager.fileName,type: .audio).path())
            for tempUtterance in tempUtterances {
                result.append(
                    UtteranceModel(
                        startAt: tempUtterance.startAt,
                        duration: tempUtterance.duration,
                        message: tempUtterance.message
                    )
                )
            }
        } catch {
            #if DEBUG
            print(error)
            #endif
        }
        return result
    }
    
    private func makeNewUtterancesV2(mediaManager: MediaManager) async -> [UtteranceModel] {
        #if DEBUG
        print(URL.getPath(fileName: mediaManager.fileName,type: .audio))
        #endif
        SystemManager.shared.instantFeedbackManager.speechRecognizerManager = SpeechRecognizerManager()
        let returnValue = await SystemManager.shared.instantFeedbackManager.speechRecognizerManager?
            .startFileRecognition(url: URL(
                fileURLWithPath: URL.getPath(fileName: mediaManager.fileName, type: .audio
            ).path())) ?? []
        SystemManager.shared.instantFeedbackManager.speechRecognizerManager = nil
        return returnValue
    }
    
    private func makeNewProject(modelContext: ModelContext) {
        let newProject = ProjectModel(
            projectName: "\(Date.now.formatted())",
            creatAt: Date.now.formatted(),
            keynotePath: nil,
            keynoteCreation: "temp"
        )
        modelContext.insert(newProject)
        temp = newProject.persistentModelID
    }
    
    private func makeNewPractice(
        project: ProjectModel,
        utterances: [UtteranceModel],
        mediaManager: MediaManager
    ) -> PracticeModel {
        /// 새 연습 모델을 생성한다.
        let result = PracticeModel(
            practiceName: "init",
            index: -1,
            isVisited: false,
            creatAt: Date().m4aNameToCreateAt(input: mediaManager.fileName),
            audioPath: URL.getPath(fileName: mediaManager.fileName, type: .audio),
            videoPath: URL.getPath(fileName: mediaManager.fileName, type: .video),
            utterances: utterances,
            summary: PracticeSummaryModel(),
            remarkable: false,
            projectCreatAt: project.creatAt
        )

        if project.practices.count == 0 {
            result.index = 0
            result.practiceName = indexToOrdinalNumber(index: 0) + "번째 연습"
        } else {
            let latestIndex = project.practices.sorted(by: {$0.creatAt > $1.creatAt}).first?.index
            if let latestIndex = latestIndex {
                result.index = latestIndex + 1
                result.practiceName = indexToOrdinalNumber(index: latestIndex + 1) + "번째 연습"
            }
        }
        return result
    }
    
    private func indexToOrdinalNumber(index: Int) -> String {
        let realIndex = index + 1
        if (realIndex == 1) { return "첫" }
        if (realIndex == 20) { return "스무" }
        let firstNum = [
            "",
            "한",
            "두",
            "세",
            "네",
            "다섯",
            "여섯",
            "일곱",
            "여덟",
            "아홉"
        ]
        let secondNum = [
            "",
            "열",
            "스물",
            "서른",
            "마흔",
            "쉰",
            "예순",
            "일흔",
            "여든",
            "아흔"
        ]
        return secondNum[realIndex / 10] + firstNum[realIndex % 10]
    }
}
