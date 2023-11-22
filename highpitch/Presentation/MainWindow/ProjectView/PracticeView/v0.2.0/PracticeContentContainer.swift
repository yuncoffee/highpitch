//
//  PracticeContentContainer.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI
#if PREVIEW
import SwiftData
#endif

struct PracticeContentContainer: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    @State
    private var isRegisterd = false
#if PREVIEW
    // MARK: - MockData
    @Query(sort: \PracticeModel.creatAt)
    var practices: [PracticeModel]
#endif
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isRegisterd {
                ZStack {
                    FullScreenVideoContainer()
                    SplitViewContainer()
                }
    //            .padding(.bottom, .HPSpacing.xxxlarge)
                if viewStore.isFullScreenTransition {
                    VideoControllerContainer()
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name.AVPlayerItemDidPlayToEndTime)) { _ in
            // 비디오 재생이 끝났을 때 처리
            // 예를 들어, 반복 재생을 원한다면 player.seek(to: CMTime.zero)와 같은 코드를 추가할 수 있습니다.
            print("비디오 재생 끝")
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name.AVPlayerItemFailedToPlayToEndTime)) { _ in
            // 비디오 재생이 실패했을 때 처리
            print("비디오 재생 실패")
        }
        .onAppear {
            if let videoPath = viewStore.practice.videoPath,
               let audioPath = viewStore.practice.audioPath {
                do {
                    try viewStore.mediaManager.registerAudio(url: audioPath)
                } catch {
                    print("오디오 생성 실패")
                }
                viewStore.mediaManager.registerVideo(url: videoPath)
            }
            isRegisterd = true
            // MARK: - Add MockData
#if PREVIEW
            if let sample = practices.first {
                viewStore.practice = sample
            }
            let url = Bundle.main.url(forResource: "20231107202138", withExtension: "m4a")
            if let url = url {
                viewStore.practice.audioPath = url
            }
#endif
        }
    }
}

#Preview {
    let modelContainer = SwiftDataMockManager.previewContainer
    
    return PracticeContentContainer()
        .modelContainer(modelContainer)
        .environment(PracticeViewStore(
            projectName: "",
            practice: PracticeModel(
                practiceName: "",
                index: 0,
                isVisited: false,
                creatAt: "",
                utterances: [],
                summary: PracticeSummaryModel()
            ),
            mediaManager: MediaManager()))
        .frame(width: 1000, height: 640)
}
