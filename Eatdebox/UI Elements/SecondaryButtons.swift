//
//  Butti.swift
//  Eatdebox
//
//  Created by Leo Heuser on 28.07.21.
//

import SwiftUI

struct SecondaryTextButton: View {
    var buttonText: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 3)
                .foregroundColor(Color("edb_red"))
                .frame(height: 50, alignment: .center)
                .padding(.horizontal)
            Text(buttonText)
                .foregroundColor(Color("edb_red"))
                .multilineTextAlignment(.center)
        }
        //.frame(width:200)
    }
}

struct SecondaryIconButton: View {
    var buttonIcon: Image
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 3)
                .foregroundColor(Color("edb_red"))
                .frame(height: 50, alignment: .center)
                .padding(.horizontal)
            Text(buttonIcon)
                .foregroundColor(Color("edb_red"))
                .multilineTextAlignment(.center)
        }
        //.frame(width:200)
    }
}


struct SecondaryButtons_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryTextButton(buttonText: "This is a button text")
            .previewLayout(.sizeThatFits)
        SecondaryIconButton(buttonIcon: Image(systemName: "plus"))
            .previewLayout(.sizeThatFits)
    }
}
