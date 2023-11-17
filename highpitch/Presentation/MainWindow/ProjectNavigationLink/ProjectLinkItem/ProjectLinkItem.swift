//
//  ProjectLinkItem.swift
//  highpitch
//
//  Created by yuncoffee on 10/14/23.
//

import SwiftUI

struct ProjectLinkItem: View {
    
    var title: String = "Placeholder1234567890"
    var isSelected = false
    var completion: () -> Void = {
        print("Default Action")
    }
    var textFieldCompletion: (_ editableText: String) -> Void = { edited in
        print("\(edited) 변경")
    }
    @State
    private var isEditModeActive = false
    @State
    private var editableText = ""
  
    var body: some View {
        let weight: FoundationTypoSystemFont.FontWeight = if isSelected { .semibold } else { .medium }
        let color: Color = if isSelected { .HPTextStyle.darker } else { .HPTextStyle.base }
        let backgroundColor: Color = if isSelected { .HPComponent.Sidebar.select } else { .clear }
        if isEditModeActive {
            TextField("프로젝트 이름 작성", text: $editableText, onCommit: {
                isEditModeActive = false
                if !editableText.isEmpty {
                    textFieldCompletion(editableText)
                    editableText = ""
                }
            })
            .systemFont(.footnote, weight: weight)
            .foregroundStyle(color)
            .frame(maxWidth: 160, minHeight: 32, alignment: .leading)
            .padding(.horizontal, .HPSpacing.xxxsmall + .HPSpacing.xxsmall)
            .padding(.vertical, 5)
            .background(backgroundColor)
            .cornerRadius(7)
            .textFieldStyle(.plain)
        } else {
            Text(title)
                .systemFont(.footnote, weight: weight)
                .foregroundStyle(color)
                .frame(maxWidth: 160, minHeight: 32, alignment: .leading)
                .padding(.vertical, 5)
                .padding(.horizontal, .HPSpacing.xxxsmall + .HPSpacing.xxsmall)
                .background(backgroundColor)
                .cornerRadius(7)
                .contentShape(Rectangle())
                .lineLimit(1)
                .onTapGesture(count: 2) {
                    isEditModeActive = true
                }
                .onTapGesture {
                    completion()
                }
        }
//        Button {
//            completion()
//        } label: {
//
//        }
//        .buttonStyle(.plain)
    }
}

#Preview {
    VStack(content: {
        ProjectLinkItem()
        ProjectLinkItem(isSelected: true)
    })
}
