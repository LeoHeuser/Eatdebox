//
//  OnlineDataDecoder.swift
//  Eatdebox
//
//  Created by Leo Heuser on 14.08.21.
//

import Foundation

class OnlineDataProcessor {
    let foodsharingApiURL = URL(string: "https://foodsharing.de/api/map/markers?types=fairteiler")
    
    var foodsharingApiData:Data?
    var foodsharingArray:OnlineResponseData?
    
    struct OnlineResponseData: Decodable {
        var fairteiler:[Foodbox]
    }
    
    // Just get the data
    func getDataFromApi() {
        var datis:Data?
        URLSession.shared.dataTask(with: foodsharingApiURL!) { data, response, error in
            if let data = data {
                self.foodsharingApiData = data
                print("I saved \(data) to the variable foodsharingApiData")
            }
        }.resume()
    }
    
    func processApiData() {
        do {
            self.foodsharingArray = try JSONDecoder().decode(OnlineResponseData.self, from: foodsharingApiData!)
            print("foodsharingArray is: \(foodsharingArray)")
        } catch {
            print("failed to convert \(error.localizedDescription)")
        }
    }
    
    func getData() {
        let task = URLSession.shared.dataTask(with: foodsharingApiURL!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("Error brudi!")
                return
            }
            // have data
            var result:OnlineResponseData?
            do {
                result = try JSONDecoder().decode(OnlineResponseData.self, from: data)
            } catch {
                print("failed to convert \(error.localizedDescription)")
            }
            guard let json = result else {
                return
            }
            print(json.fairteiler)
        })
        task.resume()
    }
    
    func getData2() {
        if let url = URL(string: "https://foodsharing.de/api/map/markers?types=fairteiler") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    print("I've got \(data)")
                    var foodboxArray:OnlineResponseData?
                    do {
                        foodboxArray = try JSONDecoder().decode(OnlineResponseData.self, from: data)
                        print(foodboxArray?.fairteiler[34])
                    } catch {
                        print("failed to convert \(error.localizedDescription)")
                    }
                }
            }.resume()
        }
    }
}
