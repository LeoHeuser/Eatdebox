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
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Londrina Solid", size: 30) ?? UIFont.systemFont(ofSize: 30), .foregroundColor: UIColor.init(red: 0.173, green: 0.600, blue: 0.400, alpha: 1)]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Londrina Solid", size: 25) ?? UIFont.systemFont(ofSize: 25), .foregroundColor: UIColor.init(red: 0.173, green: 0.600, blue: 0.400, alpha: 1)]
    }
    
    // Main view and starting point of the app
    var body: some Scene {
        WindowGroup {
            VStack{
                if (hadOnboarding) {
                    FoodboxMapView()
                } else {
                    //                    Onboarding1View()
                    OnboardingTabView()
                }
            }
        }
    }
}
