//
//  AddFoodboxView.swift
//  Eatdebox
//
//  Created by Leo Heuser on 28.07.21.
//

import SwiftUI
import MessageUI

struct AddFoodboxView: View {
    
    @State private var streetnameAndNumber = ""
    @State private var zipCode = ""
    @State private var cityname = ""
    @State private var country = "Germany"
    @State private var additionalInformation = ""
    
    let zipCodeCharacterLimit = 5
    
    var body: some View {
        Form {
            Section(header: Text("Address of the Foodbox")) {
                TextField("Streetname and Number", text: $streetnameAndNumber)
                    .keyboardType(.default)
                HStack {
                    TextField("Zip Code", text: $zipCode)
                        .frame(width: 100)
                        //.disabled(zipCode.count > (zipCodeCharacterLimit - 1))
                        .keyboardType(.numberPad)
                    TextField("Cityname", text: $cityname)
                        .keyboardType(.default)
                }
                TextField("Country", text: $country)
                    .keyboardType(.default)
                    .disabled(true)
                
            }
            Section(header: Text("Additional Information (optional)"), footer: Text("The data you provide will be processed according to our privacy policy. At no point in time we will share your email or the content with third parties.")) {
                TextEditor(text: $additionalInformation)
                    .frame(height: 150)
            }
            Button {
                print("BUTTON PRESSED")
            } label: {
                let sendEmailButton = Text("Send Email")
                    .frame(maxWidth:.infinity)
                    .multilineTextAlignment(.center)
                if (streetnameAndNumber.count != 0 && zipCode.count != 0 && cityname.count != 0 && country.count != 0) {
                    sendEmailButton.disabled(false)
                } else {
                    sendEmailButton.disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
            }
        }
        .navigationBarTitle("Add Foodbox")
        
        .navigationBarItems(trailing:
                                Button {
                                    UIApplication.shared.endEditing()
                                } label: {
                                    Image(systemName: "keyboard.chevron.compact.down")
                                }
        )
        .accentColor(Color("edb_red"))
    }
}


// extension for keyboard to dismiss [https://www.hackingwithswift.com/forums/swiftui/textfield-dismiss-keyboard-clear-button/240]
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct AddFoodboxView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodboxView()
    }
}
