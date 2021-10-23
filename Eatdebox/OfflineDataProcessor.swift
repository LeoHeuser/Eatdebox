//
//  OfflineProcessor.swift
//  Eatdebox
//
//  Created by Leo Heuser on 11.09.21.
//
import Foundation

class OfflineDataProcessor {
    // Functions to load the data
    func loadOfflineJSON() -> [Foodbox] {
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("markers.json")
        
        if let url = Bundle.main.url(forResource: "markers", withExtension: "json") {
            do {
                let data = try Data(contentsOf: documentDirectory)
                let decoder = JSONDecoder()
                let jsonData = try
                decoder.decode(ResponseData.self, from: data)
                print("Array with \(jsonData.fairteiler.count) items created")
                return jsonData.fairteiler
            } catch {
                print("loadJSON-Error: \(error)")
            }
        }
        return []
    }
}
