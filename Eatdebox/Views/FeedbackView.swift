//
//  FeedbackView.swift
//  Eatdebox
//
//  Created by Leo Heuser on 26.11.21.
//

import SwiftUI

struct FeedbackView: View {
    
    @AppStorage("userEmailAddress") var userEmailAddress: String?
    
    let feedbackCharakterLimit:Int = 500
    
    @State private var userEmail = ""
    @State private var kindOfFeedback = ""
    @State private var feedbackText = ""
    
    @State private var textSpeicher = ""
    @State private var sendFeedbackButtonDisabled = true
    
    var body: some View {
        NavigationView() {
            VStack {
                Form {
                    Section(header: Text(NSLocalizedString("header_howToContact", comment: "")), footer: Text(NSLocalizedString("text_whyEmailWithFeedback", comment: ""))) {
                        TextField(NSLocalizedString("textField_yourEmail", comment: ""),text: $userEmail)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                            .onAppear(){
                                userEmail = userEmailAddress ?? ""
                            }
                    }
                    
                    Section(header: Text(NSLocalizedString("header_kindOfFeedback", comment: ""))) {
                        Picker("kindOfFeedback", selection: $kindOfFeedback) {
                            Text(NSLocalizedString("pickerTag_error", comment: "")).tag("error")
                            Text(NSLocalizedString("pickerTag_idea", comment: "")).tag("idea")
                            Text(NSLocalizedString("pickerTag_other", comment: "")).tag("other")
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section(header: Text(NSLocalizedString("header_yourFeedback", comment: "")), footer: Text(NSLocalizedString("footer_characterLimit_pre", comment: "") + String(feedbackCharakterLimit - feedbackText.count) + NSLocalizedString("footer_characterLimit_post", comment: ""))) {
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
                    
                    Button("button_sendFeedback") {
                        writeFeedbackInDatabase(email_address: userEmail, category: kindOfFeedback, feedback: feedbackText)
                        
                        // Lokales (!) Speichern der E-Mail Adresse des Users für das nächste Feedback.
                        userEmailAddress = userEmail
                        
                        // Leeren der Textfelder
                        userEmail = userEmailAddress ?? ""
                        kindOfFeedback = ""
                        feedbackText = ""
                    }
                    .disabled(sendFeedbackButtonDisabled)
                    
                    //                    Button("Get Feedback") {
                    //                        getAllFeedbackFromDatabase()
                    //                    }
                    //                    .disabled(sendFeedbackButtonDisabled)
                }
                .onChange(of: [userEmail, kindOfFeedback, feedbackText]){ newValue in
                    // Maybe change this to a better performing function.
                    checkTextInput()
                    
                }
                .navigationBarTitle(NSLocalizedString("label_provideFeedback", comment: ""), displayMode: .inline)
            }
        }
    }
    
    func checkTextInput() {
        if !(userEmail.isValidEmail) || kindOfFeedback.isEmpty || feedbackText.isEmpty {
            sendFeedbackButtonDisabled = true
        } else {
            sendFeedbackButtonDisabled = false
        }
    }
    
    struct FeedbackView_Previews: PreviewProvider {
        static var previews: some View {
            FeedbackView()
        }
    }
}

// Input by https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}").evaluate(with: self)
    }
}
