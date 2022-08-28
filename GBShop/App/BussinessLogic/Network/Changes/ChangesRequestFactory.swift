//
//  ChangesRequestFactory.swift
//  GBShop
//
//  Created by Аня on 23.08.2022.
//

import Foundation
import Alamofire

protocol ChangesRequestFactory {
    
    func changes(
        idUser: Int,
        username: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping (AFDataResponse<ChangesResult>) -> Void)
}

