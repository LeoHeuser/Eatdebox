//
//  StaticFoodboxParameter.swift
//  Eatdebox
//
//  Created by Leo Heuser on 29.07.21.
//

import SwiftUI

struct StaticFoodboxParameter: View {
    var parameter: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(parameter)
                .foregroundColor(Color("edb_darkGrey"))
                .lineLimit(1)
            Text(value)
            
        }
        .frame(maxWidth:.infinity, alignment: .leading)
        //.padding(.vertical)
    }
}


struct StaticFoodboxParameterWithStatus: View {
    var parameter: String
    var value: String
    var statusColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(parameter)
                .foregroundColor(Color("edb_darkGrey"))
                .lineLimit(1)
            HStack {
                Circle()
                    .frame(width: 15.0, height: 15.0)
                    .foregroundColor(statusColor)
                Text(value)
            }
        }
        .frame(maxWidth:.infinity, alignment: .leading)
        //.padding(.vertical)
    }
}


struct StaticFoodboxParameterWithClipboard: View {
    var parameter: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(parameter)
                .foregroundColor(Color("edb_darkGrey"))
                .lineLimit(1)
            HStack {
                Text(value)
                Spacer()
                Button {
                    let hapticFeedback = UIImpactFeedbackGenerator(style: .heavy)
                    hapticFeedback.prepare()
                    UIPasteboard.general.string = value
                    // Provide haptic feedback when address is copied to the clipboard
                    hapticFeedback.impactOccurred()
                } label: {
                    Image(systemName: "doc.on.doc")
                }
            }
        }
        .frame(maxWidth:.infinity, alignment: .leading)
        //.padding(.vertical)
    }
}

struct StaticFoodboxParameter_Previews: PreviewProvider {
    static var previews: some View {
        StaticFoodboxParameter(parameter: "Parameter", value: "Value")
            .previewLayout(.sizeThatFits)
        StaticFoodboxParameterWithStatus(parameter: "Parameter", value: "Value", statusColor: .red)
            .previewLayout(.sizeThatFits)
        StaticFoodboxParameterWithClipboard(parameter: "Parameter", value: "Value")
            .previewLayout(.sizeThatFits)
    }
}
