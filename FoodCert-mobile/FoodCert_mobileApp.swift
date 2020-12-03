//
//  FoodCert_mobileApp.swift
//  FoodCert-mobile
//
//  Created by Denis on 11/29/20.
//

import SwiftUI

@main
struct FoodCert_mobileApp: App {
    var body: some Scene {
        WindowGroup {
            SignIn().environmentObject(Store())
        }
    }
}
