//
//  ScreenItemView.swift
//  highpitch
//
//  Created by musung on 11/14/23.
//

import SwiftUI

struct ScreenItemView: View {
    @ObservedObject var screenRecorder: ScreenRecordManager
    let index: Int
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                if index == 0 {
                    ForEach(screenRecorder.availableWindows, id: \.self) { window in
                        Button {
                            screenRecorder.selectedWindow = window
                            screenRecorder.captureType = .window
                            print(window.frame)
                        } label: {
                            VStack {
                                screenRecorder.captureWindowPreviews.first(
                                    where: { $0.displayName == window.displayName })
                                    .frame(width:139,height: 96)
                                    .aspectRatio(screenRecorder.contentSize, contentMode: .fit)
                                    .padding(8)
                                Text(window.owningApplication!.applicationName)
                            }
                        }
                    }
                } else {
                    ForEach(screenRecorder.availableDisplays, id: \.self) { display in
                        Button {
                            screenRecorder.selectedDisplay = display
                            screenRecorder.captureType = .display
                        } label: {
                            VStack {
                                screenRecorder.captureDisplayPreviews.first(
                                    where:{ $0.displayName == display.displayName })
                                    .frame(width:139,height: 96)
                                    .aspectRatio(screenRecorder.contentSize, contentMode: .fit)
                                    .padding(8)
                                Text(display.displayName)
                            }
                        }
                    }
                }
            }
            .padding(16)
        }
    }
}
extension ScreenItemView {
    
}

