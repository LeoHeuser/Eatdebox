//
//  MapView.swift
//  Eatdebox
//
//  Created by Leo Heuser on 24.11.21.
//

// Based on the StackOverflow https://stackoverflow.com/questions/67959357/clustering-annotation-with-swiftui.

import SwiftUI
import MapKit

var offlineDataProcessor = OfflineDataProcessor()


// Der Array an Daten, der in die Map kommt. Basiwerend auf der Strktur
var data = offlineDataProcessor.loadOfflineJSON()

struct MapView: UIViewRepresentable {
    var forDisplay = data
    @State private var region = LocationManager().region
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        init(_ parent: MapView) {
            self.parent = parent
        }
        /// showing annotation on the map
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard let annotation = annotation as? LandmarkAnnotation else { return nil }
            return AnnotationView(annotation: annotation, reuseIdentifier: AnnotationView.ReuseID)
        }
    }
    
    
    
    func makeCoordinator() -> Coordinator {
        MapView.Coordinator(self)
    }
    
    
    func makeUIView(context: Context) -> MKMapView {
        ///  creating a map
        let view = MKMapView()
        /// connecting delegate with the map
        view.delegate = context.coordinator
        view.setRegion(region, animated: false)
        view.mapType = .standard
        
        for points in forDisplay {
            let annotation = LandmarkAnnotation(coordinate: points.coordinate)
            view.addAnnotation(annotation)
        }
        return view
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
}



class LandmarkAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    init(
        coordinate: CLLocationCoordinate2D
    ) {
        self.coordinate = coordinate
        super.init()
    }
}



/// here posible to customize annotation view
class AnnotationView: MKMarkerAnnotationView {
    let clusterID = "clustering"
    static let ReuseID = "cultureAnnotation"
    /// setting the key for clustering annotations
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
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
