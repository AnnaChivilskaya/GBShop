//
//  Review.swift
//  GBShop
//
//  Created by Аня on 05.09.2022.
//

import Foundation

struct Review: Codable {
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
    }
}
