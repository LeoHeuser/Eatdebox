//
//  OfflineFoodbox.swift
//  Eatdebox
//
//  Created by Leo Heuser on 12.09.21.
//

import CoreLocation

// The general Foodbox-JSON Overclass
struct ResponseData: Decodable {
    var fairteiler:[Foodbox]
}

// Strucuture of Data for every Foodbox
struct Foodbox : Decodable, Identifiable {
    let ID = UUID()
    let id: Int
    let lat:Double
    let lon:Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}
