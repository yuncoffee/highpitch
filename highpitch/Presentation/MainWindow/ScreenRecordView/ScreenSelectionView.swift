//
//  ScreenSelectionView.swift
//  highpitch
//
//  Created by musung on 11/14/23.
//

import SwiftUI
import AVFoundation

struct ScreenSelectionView: View {
    @Environment(ProjectManager.self)
    private var projectManager
    @Environment(MediaManager.self)
    var mediaManager
    @State var currentTabItem = 0
    @State var isChecked = false
    @StateObject var screenRecorder = ScreenRecordManager()
    private var audioRecorder = AudioRecorder()
    @State var disableInput = false
    @State var isUnauthorized = false
    @State var fileName = ""
    @Environment(ProjectModel.self)
    var selectedProject: ProjectModel?
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @State
    private var selectedName = ""
    
    var body: some View {
        VStack {
            ZStack {
                Color.HPGray.system200
                    .frame(width: 628,height: 40)
                Text("화면 녹화")
                    .systemFont(.caption, weight: .semibold)
                    .foregroundColor(.HPTextStyle.darker)
            }
            .padding(.bottom,.HPSpacing.xxxxsmall)
            Text("녹화할 화면을 선택하고 연습을 시작해 주세요")
                .systemFont(.caption, weight: .semibold)
                .foregroundColor(.HPTextStyle.base)
                .padding(.bottom,.HPSpacing.large)
            VStack {
                screenItemView
                bottomButtons
            }
            .padding(.horizontal,.HPSpacing.small)
        }.frame(width: 628,height:570)
            .cornerRadius(.HPCornerRadius.medium)
        .onAppear {
            registerNotification()
            startPreview()
        }.onDisappear {
            stopPreview()
        }
    }
}
extension ScreenSelectionView {
    @ViewBuilder
    var screenItemView: some View {
        let views: [CapturePreview] = 
        screenRecorder.captureDisplayPreviews + screenRecorder.captureWindowPreviews
        return ScrollView {
            LazyVGrid(columns: columns, spacing: .HPSpacing.large) {
                ForEach(views, id: \.self) { preview in
                    Button {
                        if preview.type == .window {
                            screenRecorder.selectedWindow = screenRecorder.availableWindows
                                .first(where: { window in
                                window.displayName == preview.displayName
                            })
                            screenRecorder.captureType = .window
                        } else {
                            screenRecorder.selectedDisplay = screenRecorder.availableDisplays
                                .first(where: { display in
                                display.displayName == preview.displayName
                            })
                            screenRecorder.captureType = .display
                        }
                        selectedName = preview.displayName
                    } label: {
                        VStack(alignment: .center) {
                            preview
                                .frame(width:160,height: 104)
                                .aspectRatio(screenRecorder.contentSize, contentMode: .fit)
                                .border(Color.HPPrimary.base,
                                        width: (preview.displayName == selectedName && !isChecked) ? 6 : 0)
                                .cornerRadius(.HPCornerRadius.small)
                                .padding(0)
                            Text(preview.displayName.split(separator: ":").first ?? "")
                                .systemFont(.caption, weight: .semibold)
                                .foregroundColor(.HPTextStyle.dark)
                        }
                    }
                    .buttonStyle(.plain)
                    .opacity((preview.displayName == selectedName && !isChecked) ? 1 : 0.5)
                    .disabled(isChecked)
                    .padding(0)
                }
            }
            .padding(0)
        }
        .onChange(of: views) { _, _ in
            setDefalut()
        }
    }
    @ViewBuilder
    var bottomButtons: some View {
        HStack {
//            Toggle(isOn: $isChecked) {
//                Text("화면 녹화 없이 연습하기")
//                    .systemFont(.caption, weight: .semibold)
//                    .foregroundColor(.HPTextStyle.base)
//            }
            Spacer()
            HStack {
                Button(action: {
                    mediaManager.isStart = false
                }, label: {
                    Text("취소")
                        .systemFont(.caption, weight: .semibold)
                        .foregroundColor(.HPTextStyle.dark)
                })
                .frame(width: 92,height:37)
                .buttonStyle(.plain)
                .cornerRadius(.HPCornerRadius.small)
                Button(action: {
                    mediaManager.isStart = false
                    startCapture()
                    
                }, label: {
                    ZStack {
                        screenRecorder.selectedWindow == nil ? Color.HPGray.system200 : Color.HPPrimary.base
                        Text("연습 시작")
                            .systemFont(.caption, weight: .semibold)
                            .foregroundColor(screenRecorder.selectedWindow == nil ? .HPTextStyle.dark : .HPGray.systemWhite)
                    }
                })
                .frame(width: 92,height:37)
                .buttonStyle(.plain)
                .cornerRadius(.HPCornerRadius.small)
            }
        }.padding(.bottom, .HPSpacing.small)
    }
}
// MARK: 기능
extension ScreenSelectionView {
    private func setDefalut() {
        screenRecorder.selectedDisplay = screenRecorder.availableDisplays.first ?? nil
        screenRecorder.captureType = .display
        selectedName = screenRecorder.availableDisplays.first?.displayName ?? "bb"
        #if DEBUG
        print(selectedName)
        #endif
    }
    private func registerNotification() {
        NotificationCenter.default.addObserver(forName: Notification.Name("stopButtonClicked"),
                                               object: nil, queue: nil) { value in
            stopCapture()
        }
        
        // 연습 저장하지 않고 끝내기
        NotificationCenter.default.addObserver(forName: Notification.Name("cancelButtonClicked"),
                                               object: nil, queue: nil) { value in
            cancelCapture()
        }
    }
    private func playPractice() {
        #if DEBUG
        print("------연습이 시작되었습니다.-------")
        #endif
        projectManager.playPractice(
            selectedProject: selectedProject,
            mediaManager: mediaManager
        )
    }
    
    // MARK: - 연습 일시중지
    private func pausePractice() {
        projectManager.pausePractice(mediaManager: mediaManager)
    }
    func startCapture() {
        Task {
            await screenRecorder.stopPreview()
            // audioRecorder.startRecording(filename: fileName)
            // MARK: - 연습 시작
            SystemManager.shared.startInstantFeedback()
            playPractice()
            if(!isChecked) {
                fileName = mediaManager.fileName
                await screenRecorder.start(fileName: fileName)
            }
        }
    }
    func stopPreview() {
        Task {
            await screenRecorder.stopPreview()
        }
    }
    func stopCapture() {
        Task {
            // audioRecorder.stopRecording()
            await screenRecorder.stopPreview()
            await screenRecorder.stop()
            SystemManager.shared.stopInstantFeedback()
            audioRecorder.mergeAudioAndVideo(
                videoURL: URL.getPath(fileName: fileName, type: .video),
                audioURL: URL.getPath(fileName: fileName, type: .audio),
                outputURL: URL.getPath(fileName: fileName + "_merge", type: .video)
            ) { error in
                #if DEBUG
                print(error ?? "nil")
                #endif
            }
        }
    }
    
    // 연습 저장하지 않고 끝내기
    func cancelCapture() {
        Task {
            // audioRecorder.stopRecording()
            await screenRecorder.stopPreview()
            await screenRecorder.stop()
            SystemManager.shared.stopInstantFeedback()
            audioRecorder.mergeAudioAndVideo(
                videoURL: URL.getPath(fileName: fileName, type: .video),
                audioURL: URL.getPath(fileName: fileName, type: .audio),
                outputURL: URL.getPath(fileName: fileName + "_merge", type: .video)
            ) { error in
                #if DEBUG
                print(error ?? "nil")
                #endif
            }
            do {
                try FileManager.default.removeItem(at: URL.getPath(fileName: fileName, type: .video))
                try FileManager.default.removeItem(at: URL.getPath(fileName: fileName, type: .audio))
                try FileManager.default.removeItem(at: URL.getPath(fileName: fileName + "_merge", type: .video))
            } catch {
                print("파일 삭제 실패")
            }
        }
    }
    
    
    func startPreview() {
        Task {
            if await ScreenRecordManager.canRecord {
                await screenRecorder.startPreview()
            } else {
                isUnauthorized = true
                disableInput = true
            }
        }
    }
}
