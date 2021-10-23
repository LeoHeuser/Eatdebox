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
    @State private var showingMissingFeatureAlert = false
    @State private var datas = 0
    var onlineDataProcessor = OnlineDataProcessor()
    
    let appVersionVariable = (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String)!
    
    // Functions
    var body: some View {
        Form {
            StaticFoodboxParameter(parameter: NSLocalizedString("label_appVersion", comment: ""), value: appVersionVariable)
            StaticFoodboxParameter(parameter: NSLocalizedString("label_datasetVersion", comment: ""), value: "\(loadOfflineJSON().count) Foodboxes")
            Button {
                onlineDataProcessor.storeData()
                
                //showingMissingFeatureAlert = true
            } label: {
                //Text(NSLocalizedString("button_downloadFoodboxes", comment: ""))
                Text("Download data")
            }
            Button {
                onlineDataProcessor.deleteData()
            } label: {
                Text("Delete data")
            }
            Button {
                onlineDataProcessor.readData()
            } label: {
                Text("Read data")
            }
            .alert(isPresented: $showingMissingFeatureAlert) {
                Alert(title: Text(NSLocalizedString("alert_title", comment: "")), message: Text(NSLocalizedString("alert_dataText1", comment: "") + " \(7233+89) " + NSLocalizedString("alert_dataText2", comment: "")), dismissButton: .default(Text(NSLocalizedString("button_close", comment: ""))))
            }
            
            
            Section(header: Text(NSLocalizedString("becomeActive_header", comment: "")), footer: Text(NSLocalizedString("becomeActive_footer", comment: ""))) {
                Link(NSLocalizedString("button_foodsharingRulesAndTips", comment: ""), destination: URL(string: "https://wiki.foodsharing.de/Hygieneregeln")!)
                Link(NSLocalizedString("button_toFoodsharingWebsite", comment: ""), destination: URL(string: "https://foodsharing.de")!)
            }
            Section(header: Text(NSLocalizedString("button_legals", comment: ""))) {
                Link(NSLocalizedString("button_imprint", comment: ""), destination: URL(string: "https://eatdebox.eu/imprint/")!)
                Link(NSLocalizedString("button_dataPrivacy", comment: ""), destination: URL(string: "https://eatdebox.eu/data-privacy/")!)
            }
        }
        Text(NSLocalizedString("madeWithLove", comment: ""))
            .multilineTextAlignment(.center)
            .padding(.bottom)
            .navigationBarTitle(NSLocalizedString("label_about", comment: ""))
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
