//
//  FoodboxDetailView.swift
//  Eatdebox
//
//  Created by Leo Heuser on 29.07.21.
//

import SwiftUI
import CoreLocation

struct FoodboxDetailView: View {
    
    // Basic-Parameters
    var foodbox_id:Int
    var foodbox_latitude:Double
    var foodbox_longitude:Double
    
    // Additional Offline-Parameters
    @State private var foodbox_streetname:String?
    @State private var foodbox_streetnumber:String?
    @State private var foodbox_postcode:String?
    @State private var foodbox_cityname:String?
    @State private var foodbox_country:String?
    @State private var foodbox_kind_hosting:String?
    @State private var foodbox_description:String?
    
    @State private var foodboxAddress:String = NSLocalizedString("label_loading", comment: "") // Combination of multiple parameters here
    
    // View
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("")) {
                    StaticFoodboxParameter(parameter: NSLocalizedString("foodbox_id", comment: ""), value: "\(foodbox_id)")
                    
                    StaticFoodboxParameter(parameter: NSLocalizedString("foodbox_address", comment: ""), value: foodboxAddress)
                    
                    StaticFoodboxParameter(parameter: NSLocalizedString("foodbox_hostingType", comment: ""), value: "\(foodbox_kind_hosting ?? NSLocalizedString("label_loading", comment: ""))")
                    
                    StaticFoodboxParameter(parameter: NSLocalizedString("foodbox_lastActivity", comment: ""), value: "\(foodbox_kind_hosting ?? NSLocalizedString("label_loading", comment: ""))")
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
            //.navigationBarTitle("Foodbox \(foodbox_streetname ?? String(foodbox_id))", displayMode: .inline)
            .navigationBarTitle(NSLocalizedString("foodbox", comment: "") + (foodbox_streetname ?? String(foodbox_id)), displayMode: .inline)
            
            .navigationBarItems(trailing:
                                    Button {
                                                UIApplication.shared.open(URL(string: "https://foodsharing.de/?page=fairteiler&sub=ft&id=\(foodbox_id)")!)
                                            } label: {
                                                Image(systemName: "network")
                                            }
            )
        }
        .accentColor(Color("edb_red"))
        
        Button {
            getNavigationTo(latitude: "\(foodbox_latitude)", longitude: "\(foodbox_longitude)")
        } label: {
            SecondaryTextButton(buttonText: NSLocalizedString("button_navigationToFoodbox", comment: ""))
        }
        .onAppear(){
            calculateAddressfromLatAndLong()
        }
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
    
    func getStringFromURL() {
        let foodboxUrl = "https://foodsharing.de/?page=fairteiler&sub=ft&bid=1737&id=\(foodbox_id)"
        foodbox_description = foodboxUrl
        
        //        guard let theUrl = URL(string: foodboxUrl) else {
        //            print("Error: \(foodboxUrl) doesn't seem to be a valid URL")
        //            return
        //        }
        //
        //        do {
        //            let myHTMLString = try String(contentsOf: theUrl, encoding: .utf8)
        //            //print("HTML : \(myHTMLString)")
        //            foodbox_description = myHTMLString
        //        } catch let error {
        //            print("Error: \(error)")
        //        }
    }
}



//struct FoodboxDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodboxDetailView(foodbox_id: <#T##Int#>, foodbox_latitude: <#T##Double#>, foodbox_longitude: <#T##Double#>, foodbox_streetname: <#T##String?#>, foodbox_streetnumber: <#T##String?#>, foodbox_postcode: <#T##Int?#>, foodbox_cityname: <#T##String?#>, foodbox_country: <#T##String?#>, foodbox_kind_hosting: <#T##String?#>, foodbox_description: <#T##String?#>)
//    }
//}

