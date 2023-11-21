//
//  HPSlider.swift
//  highpitch
//
//  Created by musung on 11/21/23.
//

import SwiftUI

struct HPSlider: View {
    @GestureState private var isDragging = false
    @Binding var value: Double
    public let bounds: ClosedRange<CGFloat>
    public let step: CGFloat = 0.001
    public let onEditingChanged: (Bool) -> Void
    @State private var progress: CGFloat = 0
    @State private var lastDraggedProgress: CGFloat = 0
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack(alignment:.leading) {
                    Rectangle()
                        .fill(.gray)
                        .cornerRadius(3)
                    Rectangle()
                        .fill(Color.HPPrimary.base)
                        .frame(width: max(geometry.size.width * progress, 0))
                        .cornerRadius(3)
                }
                .frame(height: 4)
                .overlay(alignment: .leading) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 15, height: 15)
                        .offset(x: max(geometry.size.width * progress - 8,  -8))
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    let translationX: CGFloat = value.translation.width
                                    let calculatedProgress = 
                                        (translationX / geometry.size.width) + lastDraggedProgress
                                    progress = max(min(calculatedProgress, 1), 0)
                                    onEditingChanged(true)
                                })
                                .onEnded({ _ in
                                    lastDraggedProgress = progress
                                    onEditingChanged(false)
                                })
                        )
                }
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ value in
                            withAnimation {
                                progress = (value.location.x / geometry.size.width)
                                onEditingChanged(true)
                            }
                        })
                        .onEnded({ _ in
                            lastDraggedProgress = progress
                            onEditingChanged(false)
                        })
                )
                .onChange(of: progress) { _, newValue in
                    // progress -> value
                    value = bounds.upperBound * newValue
                }
                .onChange(of: value) { _, newValue in
                    progress = newValue / bounds.upperBound
                }
        })
    }
}
//#Preview {
//    HPSlider()
//}
