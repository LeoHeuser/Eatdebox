//
//  Onboarding3.swift
//  Eatdebox
//
//  Created by Leo Heuser on 28.07.21.
//

import SwiftUI

struct Onboarding3View: View {
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "square.stack.3d.up")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100)
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
            
            Text(NSLocalizedString("onboaring3_footnote", comment: ""))
                .font(.footnote)
                .foregroundColor(Color("edb_darkGrey"))
                .multilineTextAlignment(.center)
            
            NavigationLink(destination: MapView()) {
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
