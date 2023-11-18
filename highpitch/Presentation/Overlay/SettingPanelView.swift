//
//  SettingPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct SettingPanelView: View {
    var floatingPanelController: PanelController
    
    var body: some View {
        VStack {
            Image(systemName: "rectangle.3.group.fill")
                .frame(width:44, height: 28.11)
                .foregroundColor(SystemManager.shared.instantFeedbackManager.isDetailSettingActive ? .red : .white)
        }
        .onTapGesture {
            SystemManager.shared.instantFeedbackManager.isDetailSettingActive.toggle()
            SystemManager.shared.instantFeedbackManager.focusedPanel = .setting
            print("편집기능: \(SystemManager.shared.instantFeedbackManager.isDetailSettingActive)")
        }
    }
}
