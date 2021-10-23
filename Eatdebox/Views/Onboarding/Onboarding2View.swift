//
//  Onboarding2.swift
//  Eatdebox
//
//  Created by Leo Heuser on 28.07.21.
//

import SwiftUI

struct Onboarding2View: View {
    
    let locationManager = LocationManager()
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "location")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100)
                .foregroundColor(Color("edb_green"))
            
            Text(NSLocalizedString("onboaring2_header", comment: ""))
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom)
                .foregroundColor(Color("edb_green"))
            
            Spacer()
            
            Text(NSLocalizedString("onboaring2_text", comment: ""))
                .multilineTextAlignment(.center)
                .padding([.leading, .bottom, .trailing])
            
            NavigationLink(
                destination: Onboarding3View()) {
                    PrimaryTextButton(buttonText: NSLocalizedString("button_locationPermission", comment: ""))
                }
                .padding(.bottom)
        }
        .onDisappear() {
            locationManager.checkIfLocationServiceIsEnable()
        }
        .navigationBarHidden(true)
    }
}



struct Onboarding2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding2View()
            .previewDevice("iPhone 12 Pro")
        Onboarding2View()
            .previewDevice("iPhone 8")
    }
}
