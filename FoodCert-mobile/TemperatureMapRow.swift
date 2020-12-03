//
//  TemperatureMapRow.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/3/20.
//

import SwiftUI

struct TemperatureMapRow: View {
    @EnvironmentObject var store: Store;
    var temperatureMap: TemperatureMap
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("When measured: " + store.getDetailedFormattedDate(rawDate: temperatureMap.creationTimestamp!))
                    Spacer()
                }
            }.padding()
            Spacer()
        }
    }
}

struct TemperatureMapRow_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureMapRow(temperatureMap: TemperatureMap(_id: "1212312", isValid: nil, points: nil, creationTimestamp: "2020-12-03T10:38:01.896Z")).environmentObject(Store())
    }
}
