//
//  MapMarker.swift
//  Eatdebox
//
//  Created by Leo Heuser on 29.07.21.
//

import SwiftUI

struct FoodboxMapMarker: View, Identifiable {
    var id = UUID()
    var markerDimension = CGFloat(45)
    
    var body: some View {
        Group{
            ZStack{
                VStack(spacing: 0) {
                    ZStack {
                        Circle()
                            .frame(width: markerDimension+7, height: markerDimension+7)
                    }
                    Image(systemName: "arrowtriangle.down.fill")
                        .resizable()
                        .frame(width: markerDimension-20, height: markerDimension-20)
                        .offset(x: 0, y: -15)
                }
                .foregroundColor(Color.white)
                .shadow(color: Color(.tertiaryLabel), radius: 4, x: 0, y: 2)
                VStack(spacing: 0) {
                    ZStack {
                        Circle()
                            .frame(width: markerDimension, height: markerDimension)
                        Image(systemName: "leaf")
                            .foregroundColor(Color(.systemBackground))
                    }
                    Image(systemName: "arrowtriangle.down.fill")
                        .resizable()
                        .frame(width: markerDimension-20, height: markerDimension-20)
                        .offset(x: 0, y: -15)
                }
                .foregroundColor(Color("edb_red"))
            }
        }
    }
}

struct MapMarker_Previews: PreviewProvider {
    static var previews: some View {
        FoodboxMapMarker()
            .previewLayout(.sizeThatFits)
    }
}
