//
//  ReportView.swift
//  highpitch
//
//  Created by 이용준의 Macbook on 11/21/23.
//

import SwiftUI

struct ReportView: View {
    @Environment(PracticeViewStore.self)
    var viewStore
    
    var body: some View {
        ScrollView {
            header
        }
        .
        .frame(
            width: 650,
            height: 520,
            alignment: .topLeading
        )
        .background(Color.HPComponent.Section.background)
    }
}

extension ReportView {
    @ViewBuilder
    var header: some View {
        VStack(spacing: .HPSpacing.xxxxsmall) {
            Text("")
        }
    }
}
