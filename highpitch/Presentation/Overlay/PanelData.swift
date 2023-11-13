//
//  PanelData.swift
//  highpitch
//
//  Created by 이재혁 on 11/13/23.
//

import SwiftUI

@Observable
final class PanelData {
    private init() {}
    static var shared = PanelData()
    
    var isEditMode = false
    
    var isShow = [true, true, true, true]
    var isFocused = -1
}
