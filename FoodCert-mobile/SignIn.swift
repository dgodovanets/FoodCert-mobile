//
//  SignIn.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/2/20.
//
import Alamofire
import SwiftyJSON
import SwiftUI

struct SignIn: View {
    @EnvironmentObject var store: Store
    @State var email: String = ""
    @State var password: String = ""
    @State var authenticationDidFail: Bool = true
    @State var authSuccess: Bool = false
    
    var body: some View {
        VStack {
            TextField(store.langPack.emailPlaceholder, text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField(store.langPack.passwordPlaceholder, text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            if authenticationDidFail {
                Text(store.langPack.loginErrorMessage)
                    .offset(y: -10)
                    .foregroundColor(.red)
            }
            Button(action: {
                
            }) {
                Text(store.langPack.loginButton)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.green)
                    .cornerRadius(15.0)
            }
        }
        .padding()
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
            .environmentObject(Store())
    }
}
