//
//  LocationManager.swift
//  Eatdebox
//
//  Created by Leo Heuser on 27.08.21.
//

import MapKit

enum MapDetails {
    // Center of Germany
    static let defaultLocation = CLLocationCoordinate2D(latitude: 51.383636, longitude: 10.379746)
    // See an radius around 5 km
    static let closeSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    // See whole Germany
    static let wideSpan = MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)
}

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // Parameters
    @Published var region = MKCoordinateRegion(center: MapDetails.defaultLocation, span: MapDetails.wideSpan) // center of Germany = default view
    var locationManager: CLLocationManager?
    
    // Functions
    func checkIfLocationServiceIsEnable() {
        if CLLocationManager.locationServicesEnabled() { // Check if the location service on the PHONE is active
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
        } else {
            print("Alert! The location service is off in the settings. turn it on please.")
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            print("notDetermined")
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Alert! Your location is restricted by parental controls.")
        case .denied:
            print("You have denied the permission. Change it in the settings please.")
        case .authorizedAlways, .authorizedWhenInUse:
            print("authorized OK")
            locationManager.startUpdatingLocation()
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,span: MapDetails.closeSpan) // !!!: Unwrap the optional of location in a better way!
            locationManager.stopUpdatingLocation()
        @unknown default:
            print("Unknown code! Seems like Apple changed something")
            break
        }
    }
    
    // On change location manager listener. What will happen if the location mnager changes (the permissions change)?
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) { // This functions hits automaticcaly if the locationManager is called!
        checkLocationAuthorization()
    }
}
