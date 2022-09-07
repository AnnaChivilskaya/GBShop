//
//  LogOutRequestFactory.swift
//  GBShop
//
//  Created by Аня on 23.08.2022.
//

import Foundation
import Alamofire

protocol LogOutRequestFactory {
    
    func logout(
        idUser: Int,
        completionHandler: @escaping (AFDataResponse<LogOutResult>) -> Void)
}
