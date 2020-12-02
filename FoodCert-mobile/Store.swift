//
//  Store.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/2/20.
//

import SwiftUI

protocol LanguagePack {
    var loginButton: String { get }
    var emailPlaceholder: String { get }
    var passwordPlaceholder: String { get }
    var loginErrorMessage: String { get }
}

struct LanguagePackEN : LanguagePack {
    var loginButton: String = "SIGN IN"
    var emailPlaceholder: String = "Email"
    var passwordPlaceholder: String = "Password"
    var loginErrorMessage: String = "Incorrect credentials. Please, try again."
}

struct LanguagePackUK : LanguagePack {
    var loginButton: String = "УВІЙТИ"
    var emailPlaceholder: String = "Пошта"
    var passwordPlaceholder: String = "Пароль"
    var loginErrorMessage: String = "Неправильні дані. Будь ласка, спробуйте ще раз."

}



class Store: ObservableObject  {
    @Published var token: String?
    @Published var langActive = "EN"
    @Published var user: Any = "";
    @Published var data: Any = "";
    var baseURL = "http://localhost:3333";
    
    var langPack: LanguagePack {
        get {
            if (langActive == "EN") {
                return LanguagePackEN()
            }
            return LanguagePackUK()
        }
    }
}
