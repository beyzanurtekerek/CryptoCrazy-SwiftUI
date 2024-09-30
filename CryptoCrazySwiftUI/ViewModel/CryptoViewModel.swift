//
//  CryptoViewModel.swift
//  CryptoCrazySwiftUI
//
//  Created by Beyza Nur Tekerek on 30.09.2024.
//

import Foundation


class CryptoListViewModel: ObservableObject { // gözlemlenebilir obje
    
    @Published var cryptoList = [CryptoViewModel]()
    let webservice = WebService()
    
    
    
    func downloadCryptosContinuation(url: URL) async {
        
        do {
            let cryptos = try await webservice.downloadCurrenciesContinuation(url: url)
            DispatchQueue.main.async {
                self.cryptoList = cryptos.map(CryptoViewModel.init)
            }
        } catch {
            print(error)
        }
    }
    
//    func downloadcryptosAsync(url : URL) async {
//        do {
//            let cryptos = try await webservice.downloadCurrenciesAsync(url: url)
//            DispatchQueue.main.async {
//                self.cryptoList = cryptos.map(CryptoViewModel.init)
//            }
//        } catch {
//            print(error)
//        }
//    }
    
//    func downloadCryptos(url: URL) {
//        webservice.downloadCurrencies(url: url){ result in
//            switch result {
//                case .failure(let error):
//                    print(error)
//                case .success(let cryptos):
//                    if let cryptos = cryptos {
//                        DispatchQueue.main.async {
//                            self.cryptoList = cryptos.map(CryptoViewModel.init)
//
//                        }
//                    }
//            }
//        }
//    }
}

struct CryptoViewModel {
    
    let crypto: CryptoCurrency
    
    var id : UUID {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    
    var price : String {
        crypto.price
    }
    
}
