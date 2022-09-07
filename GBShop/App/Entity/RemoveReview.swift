//
//  File.swift
//  GBShop
//
//  Created by Аня on 05.09.2022.
//

import Foundation

struct RemoveReview: Codable {
    let result: Int
    
    enum CodingKeys: String, CodingKey {
        case result = "message"
    }
}

