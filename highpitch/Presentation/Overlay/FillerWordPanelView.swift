//
//  FillerWordPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct FillerwordPanelView: View {
    var floatingPanelController: FloatingPanelController

    var body: some View {
        VStack {
            VStack {
                Image(systemName: "gearshape.fill")
                    .frame(width: 44, height: 38)
                Text("습관어")
                    .systemFont(.caption,weight: .regular)
                    .foregroundStyle(Color.HPTextStyle.dark)
            }
            .frame(width: 120, height: 120)
            .background(Color.black.opacity(0.1))
            .cornerRadius(12)
        }
        .frame(width: 132, height: 132)
        .border(PanelData.shared.isEditMode ? (PanelData.shared.isFocused == 3 ? Color.HPPrimary.base : .white) : .clear, width: 2)
        .onTapGesture {
            PanelData.shared.isFocused = 3
        }
    }
}
