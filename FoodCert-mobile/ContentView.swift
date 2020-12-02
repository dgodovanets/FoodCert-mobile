//
//  ContentView.swift
//  FoodCert-mobile
//
//  Created by Denis on 11/29/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Hello, you!")
                    .font(.title)
                    .foregroundColor(.orange)
                HStack {
                    Text("This is my super duper app")
                        .font(.subheadline)
                    Spacer()
                    Text("By me")
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
