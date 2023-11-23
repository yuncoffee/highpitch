//
//  HPTopToolbar.swift
//  highpitch
//
//  Created by yuncoffee on 10/17/23.
//

import SwiftUI

struct HPTopToolbar<T: View, U: View>: View {
    var title: String
    var subTitle: String?
    var backButtonCompletion: (() -> Void)?
    var completion: () -> U
    var popOverContent: (() -> T)?
    
    @State
    private var isPopoverActive = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                if let completion = backButtonCompletion {
                    HPButton(type: .text, color: .HPTextStyle.base) {
                        completion()
                    } label: { type, size, color, expandable in
                        HPLabel(
                            content: (label: "키노트 열기", icon: "chevron.left"),
                            type: type,
                            size: size,
                            color: color,
                            alignStyle: .iconOnly,
                            expandable: expandable,
                            fontStyle: .system(.footnote)
                        )
                    }
                    .fixedSize()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: -.HPSpacing.xxsmall)
                }
            }
            .offset(y: 8)
            VStack(spacing: 0) {
                if let popOverContent = popOverContent {
                    Text("\(title)")
                        .systemFont(.body, weight: .medium)
                        .foregroundStyle(Color.HPTextStyle.darker)
                        .onTapGesture {
                            if !isPopoverActive {
                                isPopoverActive = true
                            }
                        }
                        .popover(isPresented: $isPopoverActive, arrowEdge: .bottom) {
                            popOverContent()
                        }
                } else {
                    Text("\(title)")
                        .systemFont(.body, weight: .medium)
                        .foregroundStyle(Color.HPTextStyle.darker)
                }
                if let subTitle {
                    Text("\(subTitle)")
                        .systemFont(.caption)
                        .foregroundStyle(Color.HPTextStyle.light)
                }
            }
            .frame(maxWidth: .infinity)
            .offset(y: 8)
            HStack(spacing: 0) {
                // MARK: - AppleScript Remove
                completion()
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, minHeight: 64)
        .background(Color.HPGray.systemWhite)
        .border(.HPComponent.stroke, width: 1, edges: [.bottom])
    }
}

extension HPTopToolbar where T == EmptyView {
    init(
        title: String,
        subTitle: String?,
        backButtonCompletion: (() -> Void)?,
        completion: @escaping () -> U
    ) {
        self.init(
            title: title,
            subTitle: subTitle,
            backButtonCompletion: backButtonCompletion,
            completion: completion,
            popOverContent: nil
        )
    }
    init(
        title: String,
        subTitle: String?,
        completion: @escaping () -> U
    ) {
        self.init(
            title: title,
            subTitle: subTitle,
            backButtonCompletion: nil,
            completion: completion,
            popOverContent: nil
        )
    }
    init(
        title: String,
        completion: @escaping () -> U
    ) {
        self.init(
            title: title,
            subTitle: nil,
            backButtonCompletion: nil,
            completion: completion,
            popOverContent: nil
        )
    }
    init(
        title: String,
        backButtonCompletion: (() -> Void)?,
        completion: @escaping () -> U
    ) {
        self.init(
            title: title,
            subTitle: nil,
            backButtonCompletion: backButtonCompletion,
            completion: completion,
            popOverContent: nil
        )
    }
}

#Preview {
    HPTopToolbar(title: "프로젝트 이름",
    backButtonCompletion: {
      print("zz")
    }, completion: {
        Text("zz")
    }, popOverContent: {
        Text("zz")
    })
    .frame(width: 1000)
}
