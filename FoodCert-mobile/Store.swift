//
//  Store.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/2/20.
//

import SwiftUI

enum Language {
    case EN, UK
}

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
    @Published var token: String = ""
    @Published var langActive = Language.EN
    @Published var user: Any = ""
    @Published var baseURL = "http://localhost:3333"
    @Published var tranportations: Array<Transportation> = []
    
    var langPack: LanguagePack {
        get {
            if (langActive == Language.EN) {
                return LanguagePackEN()
            }
            return LanguagePackUK()
        }
    }
    
    func getTempString(temp: Float64) -> String {
        if (self.langActive == .UK) {
            return (NSString(format: "%.0f", temp) as String) + "°C";
        }
        let ftemp = temp * 9/5 + 32
        return (NSString(format: "%.0f", ftemp) as String) + "°F";
    }
    
    func getFormattedDate(rawDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        let date = dateFormatter.date(from: rawDate)
        let locale: String
        if (self.langActive == .EN) {
            locale = "en_US"
        } else {
            locale = "uk_UA"
        }
        
        dateFormatter.locale = Locale(identifier: locale)
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMdyyyyhhmm")
        return dateFormatter.string(from: date!)
    }
    
    func getDetailedFormattedDate(rawDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        let date = dateFormatter.date(from: rawDate)
        let locale: String
        if (self.langActive == .EN) {
            locale = "en_US"
        } else {
            locale = "uk_UA"
        }
        
        dateFormatter.locale = Locale(identifier: locale)
        dateFormatter.setLocalizedDateFormatFromTemplate("hhmmss")
        return dateFormatter.string(from: date!)
    }
}
