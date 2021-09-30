//
//  CustomHeader.swift
//  Eatdebox
//
//  Created by Leo Heuser on 29.07.21.
//

import SwiftUI

struct CustomHeader: View {
    
    var headerText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 80.0)
                .foregroundColor(.clear)
            Text(headerText)
                .lineLimit(1)
                .padding(.horizontal)
                .font(.title)
                .multilineTextAlignment(.leading)
        }
    }
}

struct CustomHeader_Previews: PreviewProvider {
    static var previews: some View {
        CustomHeader(headerText: "Header")
            .previewLayout(.sizeThatFits)
    }
}
