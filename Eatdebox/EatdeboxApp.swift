//
//  EatdeboxApp.swift
//  Eatdebox
//
//  Created by Leo Heuser on 28.07.21.
//

import SwiftUI
import Foundation

@main struct EatdeboxApp: App {
    
    @AppStorage("hadOnboarding") var hadOnboarding: Bool = false
    
    // Stuff that happens when the app is starting
    init() {

    }
    
    // Main view and starting point
    var body: some Scene {
        WindowGroup {
            VStack{
                if (hadOnboarding) {
                    MapView()
                } else {
                    Onboarding1View()
                }
            }
        }
    }
}
