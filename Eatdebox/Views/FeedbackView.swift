//
//  FeedbackView.swift
//  Eatdebox
//
//  Created by Leo Heuser on 26.11.21.
//

import SwiftUI

struct FeedbackView: View {
    
    let feedbackCharakterLimit:Int = 1000
    
    @State private var userEmail = ""
    @State private var kindOfFeedback = ""
    @State private var feedbackText: String = ""
    
    @State private var textSpeicher = ""
    @State private var sendFeedbackButtonDisabled = true
    
    var body: some View {
        NavigationView() {
            VStack {
                Form {
                    
                    Section(header: Text("Your contact information"), footer: Text("Wir nutzen deine E-Mail-Adresse um dir bescheid zu geben, wenn dein Feedback kommt oder wir dir helfen können.")) {
                        TextField("Your email address",text: $userEmail)
                            .keyboardType(.emailAddress)
                    }
                    
                    Section(header: Text("Kind of feedback")) {
                        Picker("Kind of feedback", selection: $kindOfFeedback) {
                            Text("Error").tag("bug")
                            Text("Idea").tag("idea")
                            Text("Other").tag("other")
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section(header: Text("Your feedback"), footer: Text("Du hast noch \(feedbackCharakterLimit - feedbackText.count) Zeichen über.")) {
                        TextEditor(text: $feedbackText)
                            .frame(height: 200)
                            .onChange(of: feedbackText) { newValue in
                                // Set the limit for the text input in characters (incl. whitespace)
                                if feedbackText.count > feedbackCharakterLimit {
                                    feedbackText = textSpeicher
                                } else {
                                    textSpeicher = feedbackText
                                }
                            }
                    }
                    
                    Button("Send Feedback") {
                        print("Feedback was send")
                    }
                    .padding(.vertical)
                    .disabled(sendFeedbackButtonDisabled)
                }
                .navigationBarTitle("Provide Feedback", displayMode: .inline)
            }
        }
    }
    
    
    struct FeedbackView_Previews: PreviewProvider {
        static var previews: some View {
            FeedbackView()
        }
    }
}
