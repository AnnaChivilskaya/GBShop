//
//  BalanceCart.swift
//  GBShop
//
//  Created by Аня on 07.09.2022.
//

import Foundation

struct BalanceCart: Codable {
    let item: String
    let price: Int
    let amount: Int
    let bill: Int
    
    enum CodingKeys: String, CodingKey {
        case item = "product_name"
        case price = "product_price"
        case amount = "amount"
        case bill = "bill"
    }
}

