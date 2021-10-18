//
//  Onboarding2.swift
//  Eatdebox
//
//  Created by Leo Heuser on 28.07.21.
//

import SwiftUI

struct Onboarding2View: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "location")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100)
                .foregroundColor(Color("edb_green"))
            
            Spacer()
            
            Text(NSLocalizedString("onboaring2_header", comment: ""))
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            Text(NSLocalizedString("onboaring2_text", comment: ""))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            NavigationLink(
                destination: Onboarding3View(),
                label: {
                    PrimaryTextButton(buttonText:  NSLocalizedString("button_locationPermission", comment: ""))
                }).padding(.bottom)
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
