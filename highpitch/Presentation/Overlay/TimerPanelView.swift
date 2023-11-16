//
//  TimerPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct TimerPanelView: View {
    var floatingPanelController: FloatingPanelController
    @State private var currentTime: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Text(currentTime)
                    .systemFont(.title, weight: .semibold)
                    .foregroundStyle(Color.HPGray.systemWhite)
            }
            .frame(width: 146, height: 56)
            .background(Color.white.opacity(0.1))
            .cornerRadius(6)
        }
        .frame(width: 158, height: 68)
        .border(PanelData.shared.isEditMode ? (PanelData.shared.isFocused == 0 ? Color.HPPrimary.base : .white) : .clear, width: 2)
        .onTapGesture {
            PanelData.shared.isFocused = 0
        }
        .onAppear {
            startTimer()
        }
        .onHover {_ in
            PanelData.shared.isFocused = 0
        }
    }
    
    func startTimer() {
        // 1초마다 타이머가 현재 시간을 업데이트
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss"
            self.currentTime = formatter.string(from: Date())
        }
    }
}
