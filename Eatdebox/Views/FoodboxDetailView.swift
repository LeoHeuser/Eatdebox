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
    
    @State private var foodboxAddress:String = "Loading address...\n\n" // Combination of multiple parameters here
    
    // View
    var body: some View {
        CustomHeader(headerText: "Foodbox \(foodbox_streetname ?? String(foodbox_id))")
        
        List {
            Section(header: Text("")) {
                StaticFoodboxParameter(parameter: "Foodbox ID", value: "\(foodbox_id)")
                
                StaticFoodboxParameter(parameter: "Address", value: foodboxAddress)
                
                StaticFoodboxParameter(parameter: "Hosting type", value: "\(foodbox_kind_hosting ?? "Loading data...")")
                
                StaticFoodboxParameter(parameter: "Last activity", value: "\(foodbox_kind_hosting ?? "Loading data...")")
            }
            
            Section(header: Text("Description")) {
                Text(foodbox_description ?? "Loading data...")
                
                Button {
                    UIApplication.shared.open(URL(string: "https://wiki.foodsharing.de/Hygieneregeln")!)
                } label: {
                    Text("Rules and tips for sharing food")
                }
            }
            
        }
        .accentColor(Color("edb_red"))
        
        Button {
            getNavigationTo(latitude: "\(foodbox_latitude)", longitude: "\(foodbox_longitude)")
        } label: {
            SecondaryTextButton(buttonText: "Navigate me to this Foodbox")
        }
//        .padding(.bottom)
        
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

