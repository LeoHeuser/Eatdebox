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
    func storeData() {
        if let imageUrl = foodsharingApiURL {
            URLSession.shared.downloadTask(with: imageUrl) { (tempFileUrl, response, error) in
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
    func readData() {
        do {
            let markers = try String(contentsOf: self.documentDirectory)
            print(markers)
        } catch {
            print(error.localizedDescription)
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
