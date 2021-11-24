//
//  AcknowledgementSwiftUIElement.swift
//  Eatdebox
//
//  Created by Leo Heuser on 09.11.21.
//

import SwiftUI

struct AcknowledgementSwiftUIElement: View {
    @Environment(\.openURL) var openURL
    
    let element:String
    let licence:String
    let description:String
    let informationUrl:String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack{
                VStack(alignment: .leading){
                    Text(element)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    
                    Text(licence)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
                
                Button() {
                    openURL(URL(string: informationUrl)!)
                } label: {
                    Image(systemName: "info.circle")
                }
            }
            .padding(.vertical)
            
            Text(description)
                .multilineTextAlignment(.leading)
                .padding(.bottom)
        }
        
    }
}

struct AcknowledgementSwiftUIElement_Previews: PreviewProvider {
    static var previews: some View {
        AcknowledgementSwiftUIElement(element: "SwiftSoup",
                                      licence: "MIT Licence",
                                      description: "With the native Swift library SwiftSoup by Nabil Chatbi the project Eatdebox catches the information from the Foodsharing e.V website and prepares it to display it in the app. This generates value for the user in terms of providing the basic information about the Foodboxes.",
                                      informationUrl: "www.apple.com")
            .previewLayout(.sizeThatFits)
    }
}
