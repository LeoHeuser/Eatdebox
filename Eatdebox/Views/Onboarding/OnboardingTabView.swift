//
//  Onboarding.swift
//  Eatdebox
//
//  Created by Leo Heuser on 20.11.21.
//

import SwiftUI

struct OnboardingTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                Onboarding1View()
                Onboarding2View()
                Onboarding3View()
            }
            //.navigationBarHidden(true)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationBarItems(trailing:
                                    NavigationLink(destination: FoodboxMapView()) {
                Text(NSLocalizedString("label_skip", comment: ""))
            }
            )
        }
    }
}



struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTabView()
    }
}
