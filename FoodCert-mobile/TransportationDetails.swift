//
//  TransportationDetails.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/3/20.
//

import SwiftUI

struct TransportationDetails: View {
    @EnvironmentObject var store: Store;
    var transportation: Transportation

    var body: some View {
        VStack {
            HStack {
                TransportationRow(transportation: transportation).environmentObject(store)
                    .padding(.bottom, -10)
            }
            NavigationView {
                List(transportation.temperatureMaps!, id: \._id) { temperatureMap in
                    NavigationLink(
                        destination: TemperaturePointDetails(temperatureMap: temperatureMap)) {
                        TemperatureMapRow(temperatureMap: temperatureMap).environmentObject(store)
                    }
                }.navigationBarTitle(Text(store.langPack.temperatureProfiles))
            }
        }
    }
}

struct TransportationDetails_Previews: PreviewProvider {
    static var previews: some View {
        TransportationDetails(transportation:
                                Transportation(
                                    _id: "42342342",
                                    clientId: "123",
                                    transporterId: "345",
                                    providerId: "234",
                                    transportationStartTime: "2020-12-03T10:38:01.896Z",
                                    transportationEndTime: "2020-12-03T10:38:01.896Z",
                                    minimalAllowedTemperature: 2,
                                    maximalAllowedTemperature: 6,
                                    certificatePath: "/234wefwefw4f",
                                    temperatureMaps: [TemperatureMap(_id: "34534534534",
                                                                     isValid: false,
                                                                     points: nil,
                                                                     creationTimestamp: "2020-12-03T10:38:01.896Z")],
                                    score: 3423,
                                    evaluationAlgorithmVersion: nil))
            .environmentObject(Store())
    }
}
