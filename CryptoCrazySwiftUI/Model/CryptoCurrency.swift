//
//  CryptoCurrency.swift
//  CryptoCrazySwiftUI
//
//  Created by Beyza Nur Tekerek on 30.09.2024.
//

import Foundation

struct CryptoCurrency : Decodable, Identifiable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    private enum CodingKeys : String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
    
}
