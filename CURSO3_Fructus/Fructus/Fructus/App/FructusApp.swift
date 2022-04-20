//
//  FructusApp.swift
//  Fructus
//
//  Created by skynet on 7/4/22.
//  https://swiftuimasterclass.com

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboardingView") var isOnboardingView: Bool = true

    var body: some Scene {
       WindowGroup {
            if isOnboardingView {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
