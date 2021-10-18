//
//  Onboarding1.swift
//  Eatdebox
//
//  Created by Leo Heuser on 28.07.21.
//

import SwiftUI

struct Onboarding1View: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image(systemName: "shippingbox")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 100)
                    .foregroundColor(Color("edb_green"))
                
                Spacer()
                
                Text(NSLocalizedString("onboaring1_header", comment: ""))
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                
                Text(NSLocalizedString("onboaring1_text", comment: ""))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                NavigationLink(
                    destination: Onboarding2View(),
                    label: {
                        PrimaryTextButton(buttonText: NSLocalizedString("button_next", comment: ""))
                    }).padding(.bottom)
            }
        }
        .navigationBarHidden(true)
    }
}



struct Onboarding1_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding1View()
            .previewDevice("iPhone 12 Pro")
        Onboarding1View()
            .previewDevice("iPhone 8")
    }
}
