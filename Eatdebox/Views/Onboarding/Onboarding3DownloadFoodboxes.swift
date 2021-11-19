//
//  Onboarding4Downloading.swift
//  Eatdebox
//
//  Created by Leo Heuser on 18.11.21.
//

import SwiftUI

struct Onboarding3DownloadFoodboxes: View {
    var onlineDataProcessor = OnlineDataProcessor()
    var offlineDataProcessor = OfflineDataProcessor()
    @State private var dataHere = false
    @State private var downloadButtonDisabled = false
    @State private var mainMessage = "Press Download to load Foodboxes"
    @State private var mainImage = "arrow.down.circle"
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: mainImage)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100, maxHeight: 100)
                .foregroundColor(Color("edb_green"))
            
            Text(mainMessage)
                .multilineTextAlignment(.center)
                .padding([.top, .leading, .trailing])
            
            Spacer()
            
            // Buttons at the bottom
            if dataHere {
                
                // If data are there
                NavigationLink(destination: FoodboxMapView()) {
                    PrimaryTextButton(buttonText: "Next")
                }
                
            } else {
                
                Button {
                    DispatchQueue.global(qos: .default).async {
                        downloadButtonDisabled.toggle()
                        mainImage = "arrow.down.circle"
                        mainMessage = "Loading data..."
                        onlineDataProcessor.getAndStoreData()
                        sleep(3)
                        
                        // Checks if the new data are valid
                        if onlineDataProcessor.checkIfDataIsValid() {
                            mainImage = "hand.thumbsup"
                            mainMessage = "Now you have " + String(offlineDataProcessor.loadOfflineJSON().count) + " Foodboxes"
                            dataHere = true
                        } else {
                            mainImage = "xmark.octagon"
                            mainMessage = "There was an error downlaoding the foodboxes. Try again or later."
                            dataHere = false
                        }
                        downloadButtonDisabled.toggle()
                    }
                } label: {
                    PrimaryTextButton(buttonText: "Download latest Foodboxes")
                }
                .disabled(downloadButtonDisabled)
                
            }
            
            Text("This needs a internet connection to downlaod the latest Foodboes. This can take up to 1 minute.")
                .font(.footnote)
                .foregroundColor(Color("edb_darkGrey"))
                .multilineTextAlignment(.center)
        }
        .navigationBarHidden(true)
    }
}



struct Onboarding3DownloadFoodboxes_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3DownloadFoodboxes()
    }
}
