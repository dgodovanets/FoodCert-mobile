//
//  TemperatureMapPointRow.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/3/20.
//

import SwiftUI

struct TemperatureMapPointRow: View {
    @EnvironmentObject var store: Store;
    var temperatureMapPoint: TemperatureMapPoint
    
    func getCoordsString() -> String {
        let xStr = (NSString(format: "%.0f", temperatureMapPoint.x!) as String)
        let yStr = (NSString(format: "%.0f", temperatureMapPoint.y!) as String)
        let zStr = (NSString(format: "%.0f", temperatureMapPoint.z!) as String)
        return "X: " + xStr + "  |  Y: " + yStr + "  |  Z: " + zStr
    }
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(getCoordsString())
                    Spacer()
                }
                HStack {
                    Text(store.langPack.temperaturePre + store.getTempString(temp: temperatureMapPoint.temperatureValue!))
                    Spacer()
                }
            }.padding()
            Spacer()
        }
    }
}

struct TemperatureMapPointRow_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureMapPointRow(temperatureMapPoint: TemperatureMapPoint(_id: "1231", x: 1, y: 2, z: 3, temperatureValue: 32))
            .environmentObject(Store())
    }
}
