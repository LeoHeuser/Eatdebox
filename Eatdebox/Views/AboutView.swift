//
//  AboutView.swift
//  Eatdebox
//
//  Created by Leo Heuser on 29.07.21.
//

import SwiftUI

struct AboutView: View {
    
    // Parameter
    @State private var showingSheet = false
    let appVersionVariable = (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String)!
    
    // Functions
    var body: some View {
        Form {
            StaticFoodboxParameter(parameter: "App Version", value: appVersionVariable)
            StaticFoodboxParameter(parameter: "Dataset Version", value: "October 2021 (\(loadOfflineJSON().count) Foodboxes)")
            
            Section(header: Text("Become active and help"), footer: Text("The project Eatdebox has nothing to do with the Foodsharing e.V. in the German-speaking area. We only aim at a similar goal.")) {
                Link("Rules and tips for sharing food", destination: URL(string: "https://wiki.foodsharing.de/Hygieneregeln")!)
                Link("Foodsharing e.V. Website", destination: URL(string: "https://foodsharing.de")!)
            }
            Section(header: Text("Legal Stuff")) {
                Link("Imprint", destination: URL(string: "https://eatdebox.eu/imprint/")!)
                Link("Data Privacy", destination: URL(string: "https://eatdebox.eu/data-privacy/")!)
            }
        }
        Text("Made with ❤️ to fight against food waste")
            .padding(.bottom)
            .navigationBarTitle("About")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
            .previewDevice("iPhone 8")
        AboutView()
            .previewDevice("iPhone 12")
    }
}
