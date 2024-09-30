//
//  ContentView.swift
//  CryptoCrazySwiftUI
//
//  Created by Beyza Nur Tekerek on 30.09.2024.
//

import SwiftUI

struct MainView: View {
    
    // gözlemlenen obje
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
        
        NavigationView{
            List(cryptoListViewModel.cryptoList, id: \.id) { crypto in
                VStack{
                    Text(crypto.currency)
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity ,alignment: .leading)
                    Text(crypto.price)
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity ,alignment: .leading)

                }
            }
            .toolbar(content: {
                Button {
                    // buton clicked
                    Task.init {
//                      cryptoListViewModel.cryptoList = []
                        await cryptoListViewModel.downloadCryptosContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/refs/heads/master/crypto.json")!)
                    }
                    
                } label: {
                    Text("Refresh")
                }
            })
            .navigationTitle("Crypto Crazy") // listin sonu navigationun ici
        }.task {
            
            await cryptoListViewModel.downloadCryptosContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/refs/heads/master/crypto.json")!)
            
//            await cryptoListViewModel.downloadcryptosAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/refs/heads/master/crypto.json")!)
        }
//        .onAppear {
//            cryptoListViewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/refs/heads/master/crypto.json")!)
//        }
    }
}

#Preview {
    MainView()
}
