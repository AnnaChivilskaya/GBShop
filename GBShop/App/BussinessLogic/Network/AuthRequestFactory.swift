//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Аня on 23.08.2022.
//

import Alamofire
import Foundation

import Foundation
import Alamofire

protocol AuthRequestFactory {

    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}


