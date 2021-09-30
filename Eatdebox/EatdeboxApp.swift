//
//  EatdeboxApp.swift
//  Eatdebox
//
//  Created by Leo Heuser on 28.07.21.
//

import SwiftUI
import Foundation

var datas123Offline:[Foodbox]?
var datas123Online:[Foodbox]?


@main struct EatdeboxApp: App {
    
    
    @AppStorage("hadOnboarding") var hadOnboarding: Bool = false
 
    
    
    //var dataProcessor = DataProcessor()
    // Stuff that happens when the app is starting
    init() {
//        datas123Offline = loadOfflineJSON()
//        datas123Online = []
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
