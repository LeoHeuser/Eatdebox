//
//  SupabaseController.swift
//  Eatdebox
//
//  Created by Leo Heuser on 26.11.21.
//

import Foundation
import PostgREST

private let supabaseUrl = "https://ljiuifbbbnsgiziixdoj.supabase.co"
private let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNzk0NzA3OCwiZXhwIjoxOTUzNTIzMDc4fQ.hsYLT5GvjCsZQ-ofhYOkVxPenI4pB5fhoYxTDHwHbg0"

var database = PostgrestClient(url: "\(supabaseUrl)/rest/v1",headers: ["apikey": supabaseKey], schema: "public")

struct Feedback: Codable {
    //var id: Int?
    var email_address:String?
    var category:String?
    var feedback:String?
}

// Get the whole feedback db
func getAllFeedbackFromDatabase() {
    database.from("feedback_db").select().execute { result in
        switch result {
        case let .success(response):
            do {
                let feedback = try response.decoded(to: [Feedback].self)
                print(feedback)
            } catch {
                print(error.localizedDescription)
            }
        case let .failure(error):
            print(error.localizedDescription)
        }
    }
}

// Write something in the feedback db
func writeFeedbackInDatabase(email_address: String, category: String, feedback: String) {
    do {
        let feedback = Feedback(email_address: email_address, category: category, feedback: feedback)
        let jsonData: Data = try JSONEncoder().encode(feedback)
        
        database.from("feedback_db").insert(values: jsonData).execute { result in
            switch result {
            case let .success(response):
                do {
                    let feedback = try response.decoded(to: [Feedback].self)
                    print(feedback)
                } catch {
                    print(error.localizedDescription)
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    } catch {
        print(error.localizedDescription)
    }
}
