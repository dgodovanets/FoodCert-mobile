//
//  Store.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/2/20.
//

import SwiftUI

protocol LanguagePack {
    var login: String { get }
}

struct LanguagePackEN : LanguagePack {
    var login = "Sign in"
}

struct LanguagePackUK : LanguagePack {
    var login = "Увійти"
}



class Store: ObservableObject  {
    @Published var token: String?
    @Published var langActive = "EN"
    
    var langPack: LanguagePack {
        get {
            if (langActive == "EN") {
                return LanguagePackEN()
            }
            return LanguagePackUK()
        }
    }
}
