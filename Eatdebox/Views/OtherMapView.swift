//
//  OtherMapView.swift
//  Eatdebox
//
//  Created by Leo Heuser on 24.11.21.
//

import MapKit
import UIKit
import CoreLocation
import SwiftUI

struct OtherMapViewController: UIViewRepresentable {
    let map = MKMapView()
    let coordinate = CLLocationCoordinate2D(latitude: 40.728, longitude: -74.000)
    
    
    
    // Needed functions
    func makeUIView(context: Context) -> MKMapView {
        map.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: false)
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Code
    }
}
