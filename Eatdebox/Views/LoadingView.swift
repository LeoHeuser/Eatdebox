//
//  LoadingView.swift
//  Eatdebox
//
//  Created by Leo Heuser on 01.09.21.
//

import SwiftUI

struct LoadingView: View {
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "arrow.down")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 40)
                    //.padding()
                    .foregroundColor(Color("edb_green"))
                Image(systemName: "iphone")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 100)
                    .padding()
                    .foregroundColor(Color("edb_green"))
                Spacer()
                Text("Downloading the latest and yummiest Foodboxes from the Foodsharing e.V. API...")
                    .multilineTextAlignment(.center)
                    .padding(.all)
                Text("This can take up to 1 minute.")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                NavigationLink(
                    destination: MapView(),
                    label: {
                        PrimaryTextButton(buttonText: "GO!")
                    })
            }
            .navigationBarHidden(true)
            .onAppear() {
                print("Testolino")
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .previewDevice("iPhone 12")
        LoadingView()
            .previewDevice("iPhone 8")
    }
}
