//
//  AboutView.swift
//  Eatdebox
//
//  Created by Leo Heuser on 29.07.21.
//

import SwiftUI

struct AboutView: View {
    
    var offlineDataProcessor = OfflineDataProcessor()
    
    // Parameter
    @State private var showingSheet = false
    @State private var showDownloadErrorAlert = false
    @State private var foodboxCount = "0"
    @State private var downloadButtonDisabled = false
    
    var onlineDataProcessor = OnlineDataProcessor()
    let appVersionVariable = (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String)!
    
    // Functions
    var body: some View {
        Form {
            StaticFoodboxParameter(parameter: NSLocalizedString("label_datasetVersion", comment: ""), value: foodboxCount)
            Button {
                DispatchQueue.global(qos: .default).async {
                    downloadButtonDisabled.toggle()
                    foodboxCount = NSLocalizedString("label_loading", comment: "")
                    onlineDataProcessor.getAndStoreData()
                    sleep(3)
                    
                    // Checks if the new data are valid
                    if onlineDataProcessor.checkIfDataIsValid() {
                        foodboxCount = String(offlineDataProcessor.loadOfflineJSON().count) + NSLocalizedString("foodbox_spaceBefore", comment: "")
                    } else {
                        showDownloadErrorAlert = true
                        foodboxCount = NSLocalizedString("alertLabel_errorDataDownload", comment: "")
                    }
                    downloadButtonDisabled.toggle()
                }
            } label: {
                Text(NSLocalizedString("button_downloadFoodboxes", comment: ""))
            }
            .disabled(downloadButtonDisabled)
            .alert(isPresented: $showDownloadErrorAlert) {
                Alert(title: Text(NSLocalizedString("alertLabel_errorDataDownload", comment: "")), message: Text(NSLocalizedString("alert_dataText1", comment: "")), dismissButton: .default(Text(NSLocalizedString("button_close", comment: ""))))
            }
            
            Section(header: Text(NSLocalizedString("becomeActive_header", comment: "")), footer: Text(NSLocalizedString("becomeActive_footer", comment: ""))) {
                Link(NSLocalizedString("button_foodsharingRulesAndTips", comment: ""), destination: URL(string: "https://wiki.foodsharing.de/Hygieneregeln")!)
                Link(NSLocalizedString("button_toFoodsharingWebsite", comment: ""), destination: URL(string: "https://foodsharing.de")!)
            }
            Section(header: Text(NSLocalizedString("button_legals", comment: ""))) {
                Link(NSLocalizedString("button_imprint", comment: ""), destination: URL(string: "https://eatdebox.eu/imprint/")!)
                Link(NSLocalizedString("button_dataPrivacy", comment: ""), destination: URL(string: "https://eatdebox.eu/data-privacy/")!)
                NavigationLink(destination: ServiceView()) {
                    Text("Acknowledgements")
                }
            }
        }
        .onAppear() {
            foodboxCount = String(offlineDataProcessor.loadOfflineJSON().count) + NSLocalizedString("foodbox_spaceBefore", comment: "")
        }
        Text(NSLocalizedString("madeWithLove", comment: "") + appVersionVariable)
            .multilineTextAlignment(.center)
            .padding([.leading, .bottom, .trailing])
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
