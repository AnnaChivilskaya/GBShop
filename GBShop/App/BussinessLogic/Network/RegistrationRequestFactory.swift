//
//  RegistrationRequestFactory.swift
//  GBShop
//
//  Created by Аня on 23.08.2022.
//

import Foundation
import Alamofire

protocol RegistrationRequestFactory {
    
    func register(
        idUser: Int,
        userName: String,
        password: String,
        email: String,
        genger: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping (AFDataResponse<RegistationResult>) -> Void)
}
