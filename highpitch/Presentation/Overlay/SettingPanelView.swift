//
//  SettingPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct SettingPanelView: View {
    var floatingPanelController: FloatingPanelController
    
    var body: some View {
        VStack {
            Image(systemName: "rectangle.3.group.fill")
                .frame(width:44, height: 28.11)
                .foregroundColor(SystemManager.shared.instantFeedbackManager.isEditMode ? .red : .white)
                // .border(SystemManager.shared.instantFeedbackManager.isEditMode ? (SystemManager.shared.instantFeedbackManager.isFocused == .setting ? .purple : .white) : .clear, width: 2)
        }
        .onTapGesture {
            SystemManager.shared.instantFeedbackManager.isEditMode.toggle()
            SystemManager.shared.instantFeedbackManager.isFocused = .setting
            print("편집기능: \(SystemManager.shared.instantFeedbackManager.isEditMode)")
        }
    }
}
