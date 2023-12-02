//
//  PracticesTabItem.swift
//  highpitch
//
//  Created by yuncoffee on 10/14/23.
//

import SwiftUI
import SwiftData

struct PracticesTabItem: View {
    @Environment(ProjectManager.self)
    private var projectManager
    
    @State private var isEditing: Bool = false
    @State private var selectedItems: Set<Int> = []
    @State private var editButtonOn: Bool = false
    
    var body: some View {
        PracticeList()
    }
    
    func toggleSelection(_ index: Int) {
        if selectedItems.contains(index) {
            selectedItems.remove(index)
        } else {
            selectedItems.insert(index)
        }
    }
}

// #Preview {
//    PracticesTabItem()
//        .environment(ProjectManager())
// }

extension PracticesTabItem {
    
    private func indexToOrdinalNumber(index: Int) -> String {
        let realIndex = index + 1
        if (realIndex == 1) { return "첫" }
        if (realIndex == 20) { return "스무" }
        let firstNum = [
            "",
            "한",
            "두",
            "세",
            "네",
            "다섯",
            "여섯",
            "일곱",
            "여덟",
            "아홉"
        ]
        let secondNum = [
            "",
            "열",
            "스물",
            "서른",
            "마흔",
            "쉰",
            "예순",
            "일흔",
            "여든",
            "아흔"
        ]
        return secondNum[realIndex / 10] + firstNum[realIndex % 10]
    }
    
}
