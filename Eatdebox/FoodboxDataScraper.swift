//
//  WebdataScraper.swift
//  Eatdebox
//
//  Created by Leo Heuser on 18.10.21.
//

import Foundation
import SwiftSoup

struct FoodboxDataScraper {
    
    
    private func getRawFoodboxHtml(foodboxID: Int) -> String {
        var htmlString: String?
        
        guard let theUrl = URL(string: "https://foodsharing.de/?page=fairteiler&sub=ft&id=\(foodboxID)") else {
            print("Error: URL doesn't seem to be a valid URL")
            return "Error with URL"
        }
        do {
            htmlString = try String(contentsOf: theUrl, encoding: .utf8)
        } catch let error {
            print("Error: \(error)")
        }
        
        return htmlString ?? "Empty URL"
    }
    
    
    
    func getFoodboxDescription(foodboxID: Int) -> String? {
        let rawHTML = getRawFoodboxHtml(foodboxID: foodboxID)
        
        guard let doc: Document = try? SwiftSoup.parse(rawHTML) else { return "Empty HTML" }
        let rawDescription: Element? = try? doc.select("div.fsp-desc").first()
        let foodboxDescriptionString = try? rawDescription?.text()
        
        return foodboxDescriptionString
    }
    
    
    
    func getFoodboxName(foodboxID: Int) -> String? {
        let rawHTML = getRawFoodboxHtml(foodboxID: foodboxID)
        
        guard let doc: Document = try? SwiftSoup.parse(rawHTML) else { return "Empty HTML" }
        let rawActivity: Element? = try? doc.select("div.head").first()
        let foodboxActivityString = try? rawActivity?.text()
        
        return foodboxActivityString
    }
}
