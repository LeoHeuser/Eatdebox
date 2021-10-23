//
//  ContentView.swift
//  Eatdebox
//
//  Created by Leo Heuser on 28.07.21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @AppStorage("hadOnboarding") var hadOnboarding:Bool = false
    
    @StateObject private var locationManager = LocationManager()
    @State private var foodboxItem:Foodbox?
    @State private var foodboxData:[Foodbox] = []
    
    var offlineDataProcessor = OfflineDataProcessor()
    var onlineDataProcessor = OnlineDataProcessor()
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $locationManager.region, showsUserLocation: true, annotationItems: foodboxData)
                { foodbox in
                    MapAnnotation(coordinate: foodbox.coordinate) {
                        Button {
                            self.foodboxItem = foodbox
                            // Open the sheet view with a haptic feedback
                            let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
                            hapticFeedback.prepare()
                            hapticFeedback.impactOccurred()
                        } label: {
                            FoodboxMapMarker()
                        }
                    }
                }
                .onAppear(){
                    DispatchQueue.global(qos: .userInitiated).async {
                        if onlineDataProcessor.checkIfDataIsValid() == false {
                            // Do something if no valid data are here
                            print("Found no valid data!")
                        } else {
                            // Load the data from local file
                            foodboxData = offlineDataProcessor.loadOfflineJSON()
                        }
                    }
                }
                .accentColor(Color("edb_green"))
                .sheet(item: $foodboxItem) { foodboxItem in
                    FoodboxDetailView(foodbox_id: foodboxItem.id,
                                      foodbox_latitude: foodboxItem.lat,
                                      foodbox_longitude: foodboxItem.lon)
                }
                .edgesIgnoringSafeArea(.bottom)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            locationManager.checkIfLocationServiceIsEnable()
                        } label: {
                            PrimaryIconButton(buttonIcon: Image(systemName: "location.fill"))
                        }
                        .frame(width: 90.0)
                    }
                }
                .padding(.bottom)
            }
            .navigationBarTitle(NSLocalizedString("eatdebox_appName", comment: ""))
            .navigationBarItems(trailing:
                                    NavigationLink(destination: AboutView()) {
                Image(systemName: "info.circle")
            }
            )
        }
        .accentColor(Color("edb_red"))
        .onAppear(){
            hadOnboarding = true
            locationManager.checkIfLocationServiceIsEnable()
        }
        .navigationBarHidden(true)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
