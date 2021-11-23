//
//  Onboarding4Downloading.swift
//  Eatdebox
//
//  Created by Leo Heuser on 18.11.21.
//

import SwiftUI

struct Onboarding3View: View {
    var onlineDataProcessor = OnlineDataProcessor()
    var offlineDataProcessor = OfflineDataProcessor()
    @State private var mainImage = "arrow.down.circle"
    @State private var dataHere = false
    @State private var downloadButtonDisabled = false
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack{
                if isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("edb_green")))
                } else {
                    Image(systemName: mainImage)
                        .font(.system(size: 150, weight: .regular, design: .default))
                        .foregroundColor(Color("edb_green"))
                        .frame(maxWidth: .infinity, maxHeight: 300)
                }
            }
            Spacer()
            
            Text(NSLocalizedString("onboaring3_header", comment: ""))
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text(NSLocalizedString("onboaring3_text", comment: ""))
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            if dataHere {
                // If data are there
                NavigationLink(destination: FoodboxMapView()) {
                    PrimaryTextButton(buttonText: "Next")
                }
            } else {
                Button {
                    downloadButtonDisabled.toggle()
                    isLoading.toggle()
                    DispatchQueue.global(qos: .default).async {
                        onlineDataProcessor.getAndStoreData()
                        sleep(3)
                        
                        // Checks if the new data are valid
                        if onlineDataProcessor.checkIfDataIsValid() {
                            // mainMessage = "Now you have " + String(offlineDataProcessor.loadOfflineJSON().count) + " Foodboxes"
                            mainImage = "hand.thumbsup"
                            dataHere = true
                        } else {
                            mainImage = "xmark.octagon"
                            dataHere = false
                        }
                        isLoading.toggle()
                        downloadButtonDisabled.toggle()
                    }
                } label: {
                    PrimaryTextButton(buttonText: NSLocalizedString("button_downloadFoodboxes", comment: ""))
                }
                .disabled(downloadButtonDisabled)
            }
            
            Spacer()
                .frame(height: 50)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .clipped()
    }
    
    func startFakeNetworkCall() {
        isLoading = true
        print("isLoading = true")
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            isLoading = false
            print("isLoading = false")
        }
    }
}



struct Onboarding3View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3View()
    }
}
