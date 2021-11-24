//
//  Onboarding1.swift
//  Eatdebox
//
//  Created by Leo Heuser on 28.07.21.
//

import SwiftUI

struct Onboarding1View: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "shippingbox")
                .font(.system(size: 150, weight: .regular, design: .default))
                .foregroundColor(Color("edb_green"))
                .frame(maxWidth: .infinity, maxHeight: 300)
            
            Spacer()
            
            Text(NSLocalizedString("onboaring1_header", comment: ""))
                .font(Font.custom("Londrina Solid", size: 32, relativeTo: .largeTitle))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text(NSLocalizedString("onboaring1_text", comment: ""))
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
                .frame(height: 50)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .clipped()
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
