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
            
            Text("Find the Foodboxes next to you.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            Text("Eatdebox wants to use the location of your iPhone while you use the app. Your location helps to show Foodboxes around you.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            NavigationLink(
                destination: Onboarding3View(),
                label: {
                    PrimaryTextButton(buttonText: "Ask me")
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
