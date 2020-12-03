//
//  TemperatureMapRow.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/3/20.
//

import SwiftUI

struct TemperatureMapRow: View {
    @EnvironmentObject var store: Store;

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TemperatureMapRow_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureMapRow().environmentObject(Store())
    }
}
