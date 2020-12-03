//
//  Home.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/3/20.
//

import SwiftUI

struct TemperatureMapPoint: Codable {
    let _id: String?
    let x: Float64?
    let y: Float64?
    let z: Float64?
    let temperatureValue: Float64?
}

struct TemperatureMap: Codable {
    let _id: String?
    let isValid: Bool?
    let points: Array<TemperatureMapPoint>?
    let creationTimestamp: String?
}

struct Transportation: Codable {
    let _id: String?
    let clientId: String?
    let transporterId: String?
    let providerId: String?
    let transportationStartTime: String?
    let transportationEndTime: String?
    let minimalAllowedTemperature: Float64?
    let maximalAllowedTemperature: Float64?
    let certificatePath: String?
    let temperatureMaps: Array<TemperatureMap>?
    let score: Float64?
    let evaluationAlgorithmVersion: Float64?
}

struct GetTransportationsResponse: Codable {
    let transportations: Array<Transportation>?
    let error: String?
}

struct Home: View {
    @EnvironmentObject var store: Store;
    @State var text: String = "";
    
    private func fetch() {
        store.token = "10e987d8-fb8c-4f4a-8319-39fa00b69584"
        let url = URL(string: store.baseURL + "/getMyTransportations?authToken=" + store.token)!
        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        var resValue: GetTransportationsResponse?
        // Create the HTTP request
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                text = error.localizedDescription
            } else if let data = data {
                do {
                    resValue = try JSONDecoder().decode(GetTransportationsResponse.self, from: data)
                    if (resValue!.error != nil) {
                        text = resValue!.error!;
                    }
                    store.tranportations = resValue!.transportations!
                    text = "COUNT: " + String(resValue!.transportations!.count)
                } catch {
                    text = error.localizedDescription
                }
                
            }
        }
        
        task.resume()
    }
    
    private func handleGenerate() {
        store.token = "10e987d8-fb8c-4f4a-8319-39fa00b69584"
        let url = URL(string: store.baseURL + "/generateSample?authToken=" + store.token)!
        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        var resValue: GetTransportationsResponse?
        // Create the HTTP request
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                text = error.localizedDescription
            } else if let data = data {
                do {
                    resValue = try JSONDecoder().decode(GetTransportationsResponse.self, from: data)
                    if (resValue!.error != nil) {
                        text = resValue!.error!;
                    }
                    store.tranportations = resValue!.transportations!
                    text = "COUNT: " + String(resValue!.transportations!.count)
                } catch {
                    text = error.localizedDescription
                }
                
            }
        }
        
        task.resume()
    }

    var body: some View {
        ZStack {
            VStack {
                NavigationView {
                    List(store.tranportations, id: \._id) { transportation in
                        NavigationLink(
                            destination: TransportationDetails(transportation: transportation)) {
                            TransportationRow(transportation: transportation).environmentObject(store)
                        }
                    }.navigationBarTitle(Text(store.langPack.myTransportationsTitle))
                }
            }.padding(.top, 60)
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        handleGenerate()
                    }, label: {
                        Text(store.langPack.generateButton)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color(.systemGray5))
                            .cornerRadius(5.0)
                    })
                    Spacer()
                }
                Spacer()
            }
            TopBar().environmentObject(store)
        }
        .onAppear(perform: fetch)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(Store())
    }
}
