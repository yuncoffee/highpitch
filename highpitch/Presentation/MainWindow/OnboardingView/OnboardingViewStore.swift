//
//  OnboardingViewStore.swift
//  highpitch
//
//  Created by yuncoffee on 11/23/23.
//

import Foundation

@Observable
final class OnboardingViewStore {
    var isFinishs = [false, false]
    
    func isTestFinish() -> Bool {
        if isFinishs[0] && isFinishs[1] {
            true
        } else {
            false
        }
    }
}
