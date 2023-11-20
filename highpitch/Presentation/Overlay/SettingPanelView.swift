//
//  SettingPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct SettingPanelView: View {
    var panelController: PanelController
    var instantFeedbackManager = SystemManager.shared.instantFeedbackManager
    
    var body: some View {
        VStack {
            Image(systemName: "rectangle.3.group.fill")
                .frame(width:44, height: 28.11)
                .foregroundColor(SystemManager.shared.instantFeedbackManager.isDetailSettingActive ? .red : .white)
        }
        .overlay {
            ZStack(alignment: .topTrailing) {
                if instantFeedbackManager.focusedPanel == .setting && instantFeedbackManager.isDetailSettingActive == false {
                    Text("피드백 레이아웃 편집하기")
                        .font(Font.custom("Pretendard", size: 10))
                        .frame(width: 116, height: 23)
                        .foregroundStyle(Color.white)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .offset(x: 0, y: 28)
                        
                }
            }
        }
        .onHover { value in
            if value {
                instantFeedbackManager.focusedPanel = .setting
            } else {
                // Hover Out 되었을때, 해당 위치를 UserDefaults에 넣는다.
                UserDefaults.standard.set( String(Int(panelController.getPanelPosition()!.x)), forKey: "SpeedPanelX")
                UserDefaults.standard.set(String(Int(panelController.getPanelPosition()!.y)), forKey: "SpeedPanelY")
                
                instantFeedbackManager.focusedPanel = nil
            }
        }
        .onTapGesture {
            instantFeedbackManager.isDetailSettingActive.toggle()
            // instantFeedbackManager.focusedPanel = .setting
            print("편집기능: \(SystemManager.shared.instantFeedbackManager.isDetailSettingActive)")
        }
        .frame(width: 120, height: 120)
    }
}
