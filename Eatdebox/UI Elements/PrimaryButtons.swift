//
//  Butti.swift
//  Eatdebox
//
//  Created by Leo Heuser on 28.07.21.
//

import SwiftUI

struct PrimaryTextButton: View {
    var buttonText: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color("edb_red"))
                .frame(height: 50, alignment: .center)
                .padding(.horizontal)
            Text(buttonText)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        //.frame(width:200)
    }
}

struct PrimaryIconButton: View {
    var buttonIcon: Image
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color("edb_red"))
                .frame(height: 50, alignment: .center)
                .padding(.horizontal)
            Text(buttonIcon)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        //.frame(width:200)
    }
}


struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryTextButton(buttonText: "This is a button text")
            .previewLayout(.sizeThatFits)
        PrimaryIconButton(buttonIcon: Image(systemName: "plus"))
            .previewLayout(.sizeThatFits)
    }
}
