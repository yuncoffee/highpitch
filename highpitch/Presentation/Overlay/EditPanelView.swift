//
//  EditPanelView.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

struct EditPanelView: View {
    var floatingPanelController: FloatingPanelController
    
    @State private var fillerWordPanelOn = false
    @State private var speedPanelOn = false
    @State private var timerPanelOn = false

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
                    Toggle(isOn: $fillerWordPanelOn) {
                        Text("습관어")
                            .systemFont(.caption,weight: .semibold)
                            .foregroundStyle(Color.HPTextStyle.dark)
                            .onChange(of: fillerWordPanelOn) { _, value in
                                
                            }
                    }
                    .toggleStyle(PurpleCheckboxStyle())
                    
                    Toggle(isOn: $speedPanelOn) {
                        Text("말 빠르기")
                            .systemFont(.caption,weight: .semibold)
                            .foregroundStyle(Color.HPTextStyle.dark)
                    }
                    .toggleStyle(PurpleCheckboxStyle())
                }
                VStack(alignment: .leading) {
                    Toggle(isOn: $timerPanelOn) {
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
                    // activePanel에 모두 다 넣고
                    // 위치 조절
                }) {
                    Text("기본 레이아웃 사용")
                        .systemFont(.caption,weight: .semibold)
                        .foregroundStyle(Color.HPTextStyle.dark)
                }
                
                Spacer()
                
                Button(action: {
                    SystemManager.shared.instantFeedbackManager.isEditMode = false
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
            SystemManager.shared.instantFeedbackManager.isFocused = .detailSetting
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
