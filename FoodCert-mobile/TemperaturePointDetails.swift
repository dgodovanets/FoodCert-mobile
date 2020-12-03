//
//  TemperaturePointDetails.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/3/20.
//

import SwiftUI

struct TemperaturePointDetails: View {
    @EnvironmentObject var store: Store;
    var temperatureMap: TemperatureMap
    
    var body: some View {
        VStack {
            TemperatureMapRow(temperatureMap: temperatureMap).environmentObject(store)
            NavigationView {
                List(temperatureMap.points!, id: \._id) { point in
                        TemperatureMapPointRow(temperatureMapPoint: point).environmentObject(store)
                }.navigationBarTitle(Text(store.langPack.temperaturePoints))
            }
        }
    }
}

struct TemperaturePointDetails_Previews: PreviewProvider {
    static var previews: some View {
        TemperaturePointDetails(temperatureMap: TemperatureMap(_id: "34534534534",
                                               isValid: false,
                                               points: [TemperatureMapPoint(_id: "1231", x: 1, y: 2, z: 3, temperatureValue: 32)],
                                               creationTimestamp: "2020-12-03T10:38:01.896Z"))
            .environmentObject(Store())
    }
}
