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
            Text("필러워드")
                .font(.title)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white.opacity(0.2))
                .edgesIgnoringSafeArea(.all)
                .border(PanelData.shared.isEditMode ? (PanelData.shared.isFocused == 3 ? .purple : .white) : .clear, width: 2)
        }
        .onTapGesture {
            PanelData.shared.isFocused = 3
        }
    }
}
