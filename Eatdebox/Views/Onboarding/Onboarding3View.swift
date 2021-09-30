//
//  Onboarding3.swift
//  Eatdebox
//
//  Created by Leo Heuser on 28.07.21.
//

import SwiftUI
import MapKit

struct Onboarding3View: View {
    let locationManager = LocationManager()
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "square.stack.3d.up")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100)
                .foregroundColor(Color("edb_green"))
            
            Spacer()
            
            Text("Houston, we have no problem.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            Text("The Foodboxe’s data is handpicked and embedded into the app. Therefore, you may not have all the Foodboxes on your radar right away. But we are working on it.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            
            Text("In a later update, the data will also be available in real time from the Foodsharing e.V. API. Look forward to it.")
                .font(.footnote)
                .foregroundColor(Color("edb_darkGrey"))
                .multilineTextAlignment(.center)
            
            NavigationLink(
                destination: MapView(),
                label: {
                    PrimaryTextButton(buttonText: "Finish")
                }).padding(.bottom)
        }
        .navigationBarHidden(true)
        .onAppear() {
            locationManager.checkIfLocationServiceIsEnable()
        }
    }
}



struct Onboarding3_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3View()
            .previewDevice("iPhone 12 Pro")
        Onboarding3View()
            .previewDevice("iPhone 8")
    }
}
