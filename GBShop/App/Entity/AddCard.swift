//
//  AddCard.swift
//  GBShop
//
//  Created by Аня on 07.09.2022.
//

import Foundation

struct AddCart: Codable {
    let item: String
    let price: Int
    let amount: Int
    
    enum CodingKeys: String, CodingKey {
        case item = "product_name"
        case price = "product_price"
        case amount = "amount"
    }
}

