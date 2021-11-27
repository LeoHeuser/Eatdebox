//
//  ServiceView.swift
//  Eatdebox
//
//  Created by Leo Heuser on 27.10.21.
//

import SwiftUI

struct ServiceView: View {
    var body: some View {
        List {
            Section(header: Text(NSLocalizedString("label_header_swiftLibraries", comment: ""))) {
                AcknowledgementSwiftUIElement(element:      NSLocalizedString("label_name_swiftSoup", comment: ""),
                                              licence:      NSLocalizedString("label_license_swiftSoup", comment: ""),
                                              description:  NSLocalizedString("label_description_swiftSoup", comment: ""),
                                              informationUrl: "https://github.com/scinfu/SwiftSoup")
                
                AcknowledgementSwiftUIElement(element:      NSLocalizedString("label_name_supabase", comment: ""),
                                              licence:      NSLocalizedString("label_license_supabase", comment: ""),
                                              description:  NSLocalizedString("label_description_supabase", comment: ""),
                                              informationUrl: "https://github.com/supabase-community/supabase-swift")
            }
            
            Section(header: Text(NSLocalizedString("label_header_fonts", comment: ""))) {
                AcknowledgementSwiftUIElement(element:      NSLocalizedString("label_name_londrina", comment: ""),
                                              licence:      NSLocalizedString("label_license_londrina", comment: ""),
                                              description:  NSLocalizedString("label_description_londrina", comment: ""),
                                              informationUrl: "https://www.fontsquirrel.com/fonts/londrina")
            }
            
            Section(header: Text(NSLocalizedString("label_header_data", comment: ""))) {
                AcknowledgementSwiftUIElement(element:      NSLocalizedString("label_name_foodsharing", comment: ""),
                                              licence:      NSLocalizedString("label_license_foodsharing", comment: ""),
                                              description:  NSLocalizedString("label_description_foodsharing", comment: ""),
                                              informationUrl: "https://foodsharing.de")
            }
            
            Section(header: Text(NSLocalizedString("label_header_icons", comment: ""))) {
                AcknowledgementSwiftUIElement(element:      NSLocalizedString("label_name_sfSymbols", comment: ""),
                                              licence:      NSLocalizedString("label_license_sfSymbols", comment: ""),
                                              description:  NSLocalizedString("label_description_sfSymbols", comment: ""),
                                              informationUrl: "https://developer.apple.com/sf-symbols")
            }
        }
        .navigationBarTitle(NSLocalizedString("label_acknowledgements", comment: ""), displayMode: .inline)
    }
}


struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView()
    }
}
