//
//  HPHoverBox.swift
//  highpitch
//
//  Created by yuncoffee on 11/23/23.
//

import Foundation
import SwiftUI

struct HPHoverBox<T: View>: View {
    @State
    private var isHover = false
    var description: String = "placeholder"
    var content: () -> T

    var body: some View {
        ZStack(alignment: .top) {
            content()
                .overlay(alignment: .top) {
                    Text("\(description)")
                        .styledFont(.labeldButton)
                        .foregroundStyle(Color.HPGray.systemWhite)
                        .padding(.vertical, .HPSpacing.xxxxsmall)
                        .padding(.horizontal, .HPSpacing.xxxsmall)
                        .background(Color.HPGray.systemBlack.opacity(0.7))
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: .HPCornerRadius.small
                            )
                        )
                        .offset(y: isHover ? -28 : -24)
                        .opacity(isHover ? 1 : 0)
                        .fixedSize()
                }
        }
        .onHover(perform: { hovering in
            withAnimation {
                isHover = hovering
            }
        })
    }
}

#Preview {
    HPHoverBox(description: "Hello") {
        Text("zz")
            .frame(width: 40, height: 80)
//            .border(.red)
    }
    .padding(40)
}
