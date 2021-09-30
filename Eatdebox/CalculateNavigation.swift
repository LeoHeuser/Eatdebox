//
//  CalculateNavigation.swift
//  Eatdebox
//
//  Created by Leo Heuser on 29.07.21.
//

import Foundation
import CoreLocation
import MessageUI



// Function for the calculation and opening of the native Apple Maps application.
public func getNavigationTo(latitude:String, longitude:String) {
    
    let myAddress = "\(latitude), \(longitude)"
    let geoCoder = CLGeocoder()
    geoCoder.geocodeAddressString(myAddress) { (placemarks, error) in
        guard let placemarks = placemarks?.first else { return }
        let location = placemarks.location?.coordinate ?? CLLocationCoordinate2D()
        guard let url = URL(string:"http://maps.apple.com/?daddr=\(location.latitude),\(location.longitude)") else { return }
        UIApplication.shared.open(url)
    }
}
