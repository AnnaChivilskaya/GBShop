//
//  RemoveCart.swift
//  GBShop
//
//  Created by Аня on 07.09.2022.
//

import Foundation

struct RemoveCart: Codable {
    let item: String
    let amount: Int
    
    enum CodingKeys: String, CodingKey {
        case item = "product_name"
        case amount = "amount"
    }
}

