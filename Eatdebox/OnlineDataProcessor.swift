//
//  OnlineDataDecoder.swift
//  Eatdebox
//
//  Created by Leo Heuser on 14.08.21.
//

import Foundation

class OnlineDataProcessor {
    
    // Variables
    let foodsharingApiURL = URL(string: "https://foodsharing.de/api/map/markers?types=fairteiler")
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("markers.json")
    
    // Functions
    
    // This function gets and stores data from the API in the local drive on the iPhone.
    func getAndStoreData() {
        if let foodsharingUrl = foodsharingApiURL {
            print("Start connecting to Foodsharing e.V. API...")
            URLSession.shared.downloadTask(with: foodsharingUrl) { (tempFileUrl, response, error) in
                if let jsonTempFileUrl = tempFileUrl {
                    do {
                        // Write to file
                        let jsonData = try Data(contentsOf: jsonTempFileUrl)
                        try jsonData.write(to: self.documentDirectory)
                        print("Stored " + "\(jsonData)" + " bytes at " + "\(jsonTempFileUrl)")
                    } catch {
                        print("Error")
                    }
                }
            }.resume()
        }
    }
    
    // Function to create a String from the stored data
    func checkIfDataIsValid() -> Bool {
        do {
            let data = try Data(contentsOf: self.documentDirectory)
            // Check the size of the data set (need to be bigger then 2.000 bytes)
            if data.count < 2000 {
                return false
            } else {
                return true
            }
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    // Function to delete data at a specific location
    func deleteData() {
        do {
            try FileManager.default.removeItem(at: documentDirectory)
            print("All data killed...")
        } catch {
            print(error.localizedDescription)
        }
    }
}
