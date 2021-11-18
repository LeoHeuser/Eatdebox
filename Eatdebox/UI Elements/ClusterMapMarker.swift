//
//  ClusterMapMarker.swift
//  Eatdebox
//
//  Created by Leo Heuser on 18.11.21.
//

import SwiftUI

struct ClusterMapMarker: View {
    var markerDimension = CGFloat(65)
    var containingClusterElements = "999+"
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(.systemBackground))
                .shadow(color: Color(.tertiaryLabel), radius: 4, x: 0, y: 2)
            Circle()
                .padding(5)
                .foregroundColor(Color("edb_green"))
            Text(containingClusterElements)
                .foregroundColor(Color(.systemBackground))
                .multilineTextAlignment(.center)
        }
        .frame(width: markerDimension, height: markerDimension)
    }
}

struct ClusterMapMarker_Previews: PreviewProvider {
    static var previews: some View {
        ClusterMapMarker()
            .previewLayout(.sizeThatFits)
        
    }
}
