//
//  SignIn.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/2/20.
//
import SwiftUI

struct User: Codable {
    let smartDeviceTokens: Array<String>
    let _id: String
    let firstName: String
    let lastName: String
    let email: String
    let isAdmin: Bool
}

struct AuthResponse: Codable {
    let user: User?
    let authToken: String?
    let error: String?
}
struct SignIn: View {
    @EnvironmentObject var store: Store
    @State var email: String = ""
    @State var password: String = ""
    @State var authenticationDidFail: Bool = true
    @State var authSuccess: Bool = false
    @State var authErrorText: String = ""
    
    func checkAuth() {
        let url = URL(string: store.baseURL + "/login")!
        var request = URLRequest(url: url)
        // Serialize HTTP Body data as JSON
        let body = ["email": self.email, "password": self.password]
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )

        // Change the URLRequest to a POST request
        request.httpMethod = "POST"
        request.httpBody = bodyData
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var resValue: AuthResponse?
        // Create the HTTP request
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                authErrorText = error.localizedDescription;
            } else if let data = data {
                resValue = try? JSONDecoder().decode(AuthResponse.self, from: data)
                if (resValue!.error != nil) {
                    return authErrorText = resValue!.error!
                }
                store.user = resValue!.user!
                store.token = resValue!.authToken!
                //authErrorText = store.token!
            }
        }
        
        task.resume()
        
    }
    
    var body: some View {
        VStack {
            TextField(store.langPack.emailPlaceholder, text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .autocapitalization(.none)
            SecureField(store.langPack.passwordPlaceholder, text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            if authenticationDidFail {
                //Text(store.langPack.loginErrorMessage)
                Text(authErrorText)
                    .offset(y: -10)
                    .foregroundColor(.red)
            }
            Button(action: {
                checkAuth()
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
