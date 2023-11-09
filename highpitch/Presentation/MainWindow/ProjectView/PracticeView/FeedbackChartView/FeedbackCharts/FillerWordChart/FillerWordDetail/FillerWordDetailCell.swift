//
//  FillerWordDetailCell.swift
//  highpitch
//
//  Created by yuncoffee on 11/8/23.
//

import SwiftUI

struct FillerWordDetailCell: View {
    var isOdd: Bool
    var count: Int
    var word: String
    
    var body: some View {
        HStack {
            Text("\(word)")
                .systemFont(.body)
                .foregroundStyle(Color.HPTextStyle.darker)
            Spacer()
            Text("\(count)회")
                .systemFont(.body)
                .foregroundStyle(Color.HPPrimary.base)
        }
        .padding(.vertical, .HPSpacing.xsmall + .HPSpacing.xxxxsmall)
        .padding(.horizontal, .HPSpacing.medium)
        .frame(width: 348)
        .background(!isOdd ? Color.HPComponent.Section.point : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    FillerWordDetailCell(isOdd: false, count: 0, word: "아")
}
