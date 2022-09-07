//
//  ReviewList.swift
//  GBShop
//
//  Created by Аня on 05.09.2022.
//

import Foundation

struct ReviewResult: Codable {
    let list: [Review]
    
    enum CodingKeys: String, CodingKey {
        case list = "ReviewResult.json"
    }
}

