//
//  MapView.swift
//  Eatdebox
//
//  Created by Leo Heuser on 24.11.21.
//

// Based on the StackOverflow https://stackoverflow.com/questions/67959357/clustering-annotation-with-swiftui.

import SwiftUI
import MapKit

// Variables
var offlineDataProcessor = OfflineDataProcessor()

struct MapView: UIViewRepresentable {
    var data = offlineDataProcessor.loadOfflineJSON()
    var region = LocationManager().region
    
    func makeCoordinator() -> Coordinator {
        MapView.Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let view = MKMapView()
        // connecting delegate with the map
        view.delegate = context.coordinator
        view.setRegion(region, animated: false)
        view.mapType = .standard
        
        for points in data {
            let annotation = LandmarkAnnotation(coordinate: points.coordinate)
            view.addAnnotation(annotation)
        }
        return view
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Empty function
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        init(_ parent: MapView) {
            self.parent = parent
        }
        // showing annotation on the map
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? LandmarkAnnotation else { return nil }
            return AnnotationView(annotation: annotation, reuseIdentifier: AnnotationView.ReuseID)
        }
    }
}

class LandmarkAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
}

// here possible to customise annotation view
class AnnotationView: MKMarkerAnnotationView {
    let clusterID = "clustering"
    static let ReuseID = "cultureAnnotation"
    
    // setting the key for clustering annotations
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        super.markerTintColor = UIColor.init(red: 0.173, green: 0.600, blue: 0.400, alpha: 1)
        super.glyphText = "BOX"
        clusteringIdentifier = clusterID
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        displayPriority = .defaultLow
    }
}
