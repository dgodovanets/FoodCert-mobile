//
//  TopBar.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/3/20.
//

import SwiftUI

struct TopBar: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Button(action: {
                        store.langActive = Language.EN
                    }, label: {
                        if store.langActive != Language.EN {
                            Text("EN")
                                .foregroundColor(.black)
                                .padding()
                        } else {
                            Text("EN")
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(15.0)
                        }
                        
                    })
                    .disabled(store.langActive == Language.EN)
                    .padding(.leading)
                    
                    
                    Button(action: {
                        store.langActive = Language.UK
                    }, label: {
                        if store.langActive != Language.UK {
                            Text("UK")
                                .foregroundColor(.black)
                                .padding()
                        } else {
                            Text("UK")
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(15.0)
                        }
                    })
                    .disabled(store.langActive == Language.UK)
                }
                Spacer()
                if store.token != "" {
                    Button(action: {
                        store.token = "";
                    }, label: {
                        Text(store.langPack.logoutButton)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color(.systemGray5))
                            .cornerRadius(5.0)
                    })
                    .padding(.trailing)
                }
            }
            Spacer()
        }
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar().environmentObject(Store())
    }
}
