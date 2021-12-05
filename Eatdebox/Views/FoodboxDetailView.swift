//
//  FoodboxDetailView.swift
//  Eatdebox
//
//  Created by Leo Heuser on 29.07.21.
//

import SwiftUI
import CoreLocation
import SwiftSoup
import MapKit

struct FoodboxDetailView: View {
    
    // Basic-Parameters
    var foodbox_id:Int
    var foodbox_latitude:Double
    var foodbox_longitude:Double
    
    var foodboxDataScraper = FoodboxDataScraper()
    
    // Additional Offline-Parameters
    @State private var foodbox_streetname:String?
    @State private var foodbox_streetnumber:String?
    @State private var foodbox_postcode:String?
    @State private var foodbox_cityname:String?
    @State private var foodbox_country:String?
    @State private var foodbox_kind_hosting:String?
    @State private var foodbox_description:String?
    @State private var foodbox_lastActivity:String?
    
    @State private var showingNavigationActionSheet = false
    @State private var selection = "None"
    
    @State private var foodboxAddress:String = NSLocalizedString("label_loadingAddress", comment: "") // Combination of multiple parameters here
    
    @State private var foodboxRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.383636, longitude: 10.379746), latitudinalMeters: 100000, longitudinalMeters: 100000)
    
    
    // View
    var body: some View {
        NavigationView {
            List {
                Section() {
                    StaticFoodboxParameter(parameter: NSLocalizedString("foodbox_id", comment: ""), value: "\(foodbox_id)")
                    
                    StaticFoodboxParameterWithClipboard(parameter: NSLocalizedString("foodbox_address", comment: ""), value: foodboxAddress)
                    
                    Map(coordinateRegion: $foodboxRegion)
                        .frame(height: 200)
                        .disabled(true)
                }
                
                Section(header: Text(NSLocalizedString("foodbox_header_description", comment: ""))) {
                    Text(foodbox_description ?? NSLocalizedString("label_loading", comment: ""))
                    
                    Button {
                        UIApplication.shared.open(URL(string: "https://wiki.foodsharing.de/Hygieneregeln")!)
                    } label: {
                        Text(NSLocalizedString("button_foodsharingRulesAndTips", comment: ""))
                    }
                }
            }
            .navigationBarTitle(NSLocalizedString("foodbox_spaceAfter", comment: "") + (foodbox_streetname ?? String(foodbox_id)), displayMode: .inline)
            .navigationBarItems(trailing: Button {
                UIApplication.shared.open(URL(string: "https://foodsharing.de/?page=fairteiler&sub=ft&id=\(foodbox_id)")!)
            } label: {
                Image(systemName: "network")
            })
        }
        Button {
            showingNavigationActionSheet.toggle()
            //getNavigationTo(latitude: "\(foodbox_latitude)", longitude: "\(foodbox_longitude)")
        } label: {
            SecondaryTextButton(buttonText: NSLocalizedString("button_navigationToFoodbox", comment: ""))
        }
        .onAppear(){
            DispatchQueue.global(qos: .default).async {
                foodbox_description = foodboxDataScraper.getFoodboxDescription(foodboxID: foodbox_id)
                calculateAddressfromLatAndLong()
                
                foodboxRegion = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: foodbox_latitude,
                                                   longitude: foodbox_longitude),
                    latitudinalMeters: 500,
                    longitudinalMeters: 500
                )
            }
        }
        .actionSheet(isPresented: $showingNavigationActionSheet) {
            ActionSheet(
                title: Text(NSLocalizedString("label_chooseToolToNavigate", comment: "")),
                buttons: [
                    .default(Text(NSLocalizedString("label_AppleMaps", comment: ""))) {
                        getNavigationTo(app:"apple", latitude: "\(foodbox_latitude)", longitude: "\(foodbox_longitude)")
                    },
                    .default(Text(NSLocalizedString("label_GoogleMaps", comment: ""))) {
                        getNavigationTo(app:"google", latitude: "\(foodbox_latitude)", longitude: "\(foodbox_longitude)")
                    },
                    .cancel()
                ]
            )
        }
        .accentColor(Color("edb_red"))
    }
    
    
    
    
    // Functions
    func calculateAddressfromLatAndLong() {
        
        let location = CLLocation(latitude: foodbox_latitude , longitude: foodbox_longitude)
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
            if error != nil {
                print("Reverse geocoder failed with error" + error!.localizedDescription)
                return
            }
            
            if placemarks != nil {
                if placemarks!.count > 0 {
                    let placemark = placemarks![0]
                    // Assign values if not nil to constances
                    if placemark.thoroughfare != nil {
                        foodbox_streetname = placemark.thoroughfare!
                    }
                    if placemark.subThoroughfare != nil {
                        foodbox_streetnumber = placemark.subThoroughfare!
                    }
                    if placemark.postalCode != nil {
                        foodbox_postcode = placemark.postalCode!
                    }
                    if placemark.locality != nil {
                        foodbox_cityname = placemark.locality!
                    }
                    if placemark.country != nil {
                        foodbox_country = placemark.country!
                    }
                }
            }
            foodboxAddress = "\(foodbox_streetname ?? "") \(foodbox_streetnumber ?? "")\n\(foodbox_postcode ?? "") \(foodbox_cityname ?? "")\n\(foodbox_country ?? "")"
        })
    }
}



struct FoodboxDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodboxDetailView(foodbox_id: 324, foodbox_latitude: 51.22250, foodbox_longitude: 6.77270)
    }
}
