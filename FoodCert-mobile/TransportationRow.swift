//
//  TransportationRow.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/3/20.
//

import SwiftUI

struct TransportationRow: View {
    @EnvironmentObject var store: Store;

    var transportation: Transportation
    @State private var text: String = ""
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("Date: " + store.getFormattedDate(rawDate: transportation.transportationStartTime!))
                    Spacer()
                }
                HStack {
                    Text("Min temp: " + store.getTempString(temp: transportation.minimalAllowedTemperature!))
                    Spacer()
                }
                HStack {
                    Text("Max temp: " + store.getTempString(temp: transportation.maximalAllowedTemperature!))
                    Spacer()
                }
                HStack {
                    Text("Score: " + (NSString(format: "%.0f", transportation.score!) as String))
                    Spacer()
                }
            }.padding()
            Spacer()
        }
    }
}

struct TransportationRow_Previews: PreviewProvider {
    static var previews: some View {
        TransportationRow(transportation:
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
