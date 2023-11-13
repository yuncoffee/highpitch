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
                .foregroundColor(.white)
                .border(PanelData.shared.isEditMode ? (PanelData.shared.isFocused == 1 ? .purple : .white) : .clear, width: 2)
        }
        .onTapGesture {
            PanelData.shared.isEditMode.toggle()
            print("편집기능: \(PanelData.shared.isEditMode)")
        }
        .onTapGesture {
            PanelData.shared.isFocused = 1
        }
    }
}
