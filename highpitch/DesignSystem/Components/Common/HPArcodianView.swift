//
//  HPArcodianView.swift
//  highpitch
//
//  Created by yuncoffee on 11/12/23.
//

import SwiftUI

struct HPArcodianView<T: View>: View {
    var label: String = "컨텐츠 명"
    var content: () -> T
    
    @State
    var isActive: Bool?
    
    @State
    private var localIsActive = true
    private let HEADER_HEIGHT = 68.0
     
    var body: some View {
        VStack(spacing: .zero) {
            header
            content()
        }
        .frame(
            maxHeight: localIsActive 
            ? .infinity
            : HEADER_HEIGHT,
            alignment: .top
        )
        .background(
            RoundedRectangle(cornerRadius: .HPCornerRadius.large)
                .stroke(lineWidth: 2)
                .foregroundStyle(Color.HPComponent.stroke)
        )
        .clipShape(RoundedRectangle(cornerRadius: .HPCornerRadius.large))
        .onChange(of: isActive) { _, newValue in
            if let isActive = newValue {
                localIsActive = isActive
            }
        }
    }
}

extension HPArcodianView {
    @ViewBuilder
    private var header: some View {
        // header
        HStack {
            Text(label)
                .systemFont(.caption, weight: .semibold)
                .foregroundStyle(Color.HPTextStyle.darker)
            Spacer()
            HPButton(type: .text, size: .medium, color: .HPTextStyle.base) {
                withAnimation {
                    localIsActive.toggle()
                }
            } label: { type, size, color, expandable in
                HPLabel(
                    content: ("열기", "chevron.down"),
                    type: type,
                    size: size,
                    color: color,
                    alignStyle: .iconOnly,
                    expandable: expandable
                )
            }
            .frame(width: ButtonSize.medium.labelSize.height)
            .rotationEffect(localIsActive ? .degrees(180) : .zero)
        }
        .padding(.vertical, .HPSpacing.xsmall)
        .padding(.horizontal, .HPSpacing.xsmallBetweenSmall)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                localIsActive.toggle()
            }
        }
    }
}

#Preview {
    HPArcodianView {
        Text("Hello")
            .border(.blue)
    }
    .padding(64)
}
