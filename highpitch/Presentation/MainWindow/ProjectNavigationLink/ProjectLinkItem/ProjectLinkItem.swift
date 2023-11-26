//
//  ProjectLinkItem.swift
//  highpitch
//
//  Created by yuncoffee on 10/14/23.
//

import SwiftUI

struct ProjectLinkItem: View {
    @Environment(ProjectManager.self)
    private var projectManager
    
    var title: String = "Placeholder1234567890"
    var isSelected = false
    var completion: () -> Void = {
        #if DEBUG
        print("Default Action")
        #endif
        
    }
    var textFieldCompletion: (_ editableText: String) -> Void = { edited in
        #if DEBUG
        print("\(edited) 변경")
        #endif
    }
    var focusField: FocusState<String?>.Binding
    @State
    var isEditModeActive = false
    @State
    private var editableText = ""
    @Binding
    var addedProjectID: String?
  
    var body: some View {
        let weight: FoundationTypoSystemFont.FontWeight = if isSelected { .semibold } else { .medium }
        let color: Color = if isSelected { .HPTextStyle.darker } else { .HPTextStyle.base }
        let backgroundColor: Color = if isSelected { .HPComponent.Sidebar.select } else { .clear }
        
        if isSelected && isEditModeActive {
            TextField("프로젝트 이름 작성", text: $editableText,
                      onCommit: {
                addedProjectID = nil
                isEditModeActive = false
                if !editableText.isEmpty {
                    textFieldCompletion(editableText)
                    editableText = ""
                }
                focusField.wrappedValue = nil
            })
            .focused(focusField, equals: projectManager.current?.creatAt)
            .systemFont(.footnote, weight: .medium)
            .foregroundStyle(Color.HPTextStyle.dark)
            .textFieldStyle(.plain)
            .padding(.horizontal, .HPSpacing.xsmall)
            .frame(maxWidth: .infinity, minHeight: 36, maxHeight: 36)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.HPPrimary.base, lineWidth: 1)
            )
            .padding(.horizontal, 6)
            .onAppear {
                editableText = title
            }
        } else {
            Text(title)
                .systemFont(.footnote, weight: weight)
                .foregroundStyle(color)
                .padding(.horizontal, .HPSpacing.xxxsmall + .HPSpacing.xxsmall)
                .frame(maxWidth: .infinity, minHeight: 36, maxHeight: 36, alignment: .leading)
                .background(backgroundColor)
                .cornerRadius(7)
                .contentShape(Rectangle())
                .lineLimit(1)
                .onTapGesture(count: 2) {
                    addedProjectID = nil
                    completion()
                    isEditModeActive = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        focusField.wrappedValue = projectManager.current?.creatAt  
                    }
                    
                }
                .onTapGesture {
                    addedProjectID = nil
                    isEditModeActive = false
                    completion()
                }
        }
    }
}

#Preview {
    VStack(content: {
//        ProjectLinkItem()
//        ProjectLinkItem(isSelected: true)
    })
}
