//
//  MapMarker.swift
//  Eatdebox
//
//  Created by Leo Heuser on 29.07.21.
//

import SwiftUI

struct FoodboxMapMarker: View, Identifiable {
    var id = UUID()
    var clusteringIdentifier: String? = "lol"
    
    var markerDimension = CGFloat(45)
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(.systemBackground))
                .shadow(color: Color(.tertiaryLabel), radius: 4, x: 0, y: 2)
            Circle()
                .padding(5)
                .foregroundColor(Color("edb_red"))
            Image(systemName: "leaf")
                .foregroundColor(Color(.systemBackground))
        }
        .frame(width: markerDimension, height: markerDimension)
    }
}

struct MapMarker_Previews: PreviewProvider {
    static var previews: some View {
        FoodboxMapMarker()
            .previewLayout(.sizeThatFits)
        
    }
}
