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
    @State private var dataHere = false
    @State private var downloadButtonDisabled = false
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack{
                Image(systemName: "arrow.down.circle")
                    .font(.system(size: 150, weight: .regular, design: .default))
                    .foregroundColor(Color("edb_green"))
                    .frame(maxWidth: .infinity, maxHeight: 300)
            }
            Spacer()
            if isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("edb_green")))
            }
            
            if dataHere {
                // If data are there
                NavigationLink(destination: FoodboxMapView()) {
                    PrimaryTextButton(buttonText: "Next")
                }
            } else {
                Button {
                    print("I was pressed")
                    downloadButtonDisabled = true
//                    downloadButtonDisabled.toggle()
//                    isLoading.toggle()
//                    DispatchQueue.global(qos: .default).async {
//                        onlineDataProcessor.getAndStoreData()
//                        sleep(3)
//
//                        // Checks if the new data are valid
//                        if onlineDataProcessor.checkIfDataIsValid() {
//                            // mainMessage = "Now you have " + String(offlineDataProcessor.loadOfflineJSON().count) + " Foodboxes"
//                            dataHere = true
//                        } else {
//                            dataHere = false
//                        }
//                        isLoading.toggle()
//                        downloadButtonDisabled.toggle()
//                    }
                } label: {
                    PrimaryTextButton(buttonText: "Download latest Foodboxes")
                }
                .disabled(downloadButtonDisabled)
            }
            
            Spacer()
                .frame(height: 50)
        }
        .navigationBarHidden(true)
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
