//
//  Onboarding3.swift
//  Eatdebox
//
//  Created by Leo Heuser on 28.07.21.
//

import SwiftUI

struct Onboarding3View: View {
    
    @AppStorage("hadOnboarding") var hadOnboarding: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("imgOnboardingDownload_See")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color("edb_green"))
            
            Text(NSLocalizedString("onboaring3_header", comment: ""))
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom)
                .foregroundColor(Color("edb_green"))
            
            Spacer()
            
            Text(NSLocalizedString("onboaring3_text", comment: ""))
                .multilineTextAlignment(.center)
                .padding([.leading, .bottom, .trailing])
            
            NavigationLink(destination: FoodboxMapView()) {
                PrimaryTextButton(buttonText: NSLocalizedString("button_finish", comment: ""))
            }
            .padding(.bottom)
        }
        .navigationBarHidden(true)
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
