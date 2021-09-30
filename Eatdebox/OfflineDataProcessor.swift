//
//  OfflineProcessor.swift
//  Eatdebox
//
//  Created by Leo Heuser on 11.09.21.
//
import Foundation


// Functions to load the data
func loadOfflineJSON() -> [Foodbox] {
    if let url = Bundle.main.url(forResource: "markers", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
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
