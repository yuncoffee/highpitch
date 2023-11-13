//
//  EditPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct EditPanelView: View {
    var floatingPanelController: FloatingPanelController
    
    @State private var isChecked1 = false
    @State private var isChecked2 = false
    @State private var isChecked3 = false

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack(spacing: 0) {
                    Text("실시간 피드백 받을 항목을 선택 및 이동해서")
                        .systemFont(.caption,weight: .semibold)
                        .foregroundStyle(Color.HPTextStyle.dark)
                    Text("레이아웃을 편집해보세요.")
                        .systemFont(.caption,weight: .semibold)
                        .foregroundStyle(Color.HPTextStyle.dark)
                }
            }
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Toggle(isOn: $isChecked1) {
                        Text("습관어")
                            .systemFont(.caption,weight: .semibold)
                            .foregroundStyle(Color.HPTextStyle.dark)
                    }
                    .toggleStyle(PurpleCheckboxStyle())
                    
                    Toggle(isOn: $isChecked2) {
                        Text("말 빠르기")
                            .systemFont(.caption,weight: .semibold)
                            .foregroundStyle(Color.HPTextStyle.dark)
                    }
                    .toggleStyle(PurpleCheckboxStyle())
                }
                VStack(alignment: .leading) {
                    Toggle(isOn: $isChecked3) {
                        Text("타이머")
                            .systemFont(.caption,weight: .semibold)
                            .foregroundStyle(Color.HPTextStyle.dark)
                    }
                    .toggleStyle(PurpleCheckboxStyle())
                    
                }
            }
        
            Spacer()
            
            HStack {
                Button(action: {
                    // 버튼이 클릭되었을 때 수행되는 동작
                }) {
                    Text("기본 레이아웃 사용")
                        .systemFont(.caption,weight: .semibold)
                        .foregroundStyle(Color.HPTextStyle.dark)
                }
                
                Spacer()
                
                Button(action: {
                    // 버튼이 클릭되었을 때 수행되는 동작
                }) {
                    Text("취소")
                        .systemFont(.caption,weight: .semibold)
                        .foregroundStyle(Color.HPTextStyle.dark)
                        
                }
                .background(Color.HPPrimary.base)
                Button(action: {
                    // 버튼이 클릭되었을 때 수행되는 동작
                }) {
                    Text("확인")
                }
            }
        }
        .frame(width: 436, height: 252)
        .background(Color.white)
        .onTapGesture {
            PanelData.shared.isFocused = 3
        }
    }
}

struct PurpleCheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(Color.HPPrimary.base)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
        .padding()
    }
}
