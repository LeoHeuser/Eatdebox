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
        VStack(spacing: 20) {
            Image(systemName: "location.viewfinder")
                .font(.system(size: 150, weight: .regular, design: .default))
                .foregroundColor(Color("edb_green"))
                .frame(maxWidth: .infinity, maxHeight: 300)
            
            Spacer()
            
            Text(NSLocalizedString("onboaring2_header", comment: ""))
                .font(Font.custom("Londrina Solid", size: 32, relativeTo: .largeTitle))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text(NSLocalizedString("onboaring2_text", comment: ""))
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button {
                locationManager.checkIfLocationServiceIsEnable()
            }  label: {
                PrimaryTextButton(buttonText: NSLocalizedString("button_locationPermission", comment: ""))
            }
            
            Spacer()
                .frame(height: 50)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .clipped()
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
