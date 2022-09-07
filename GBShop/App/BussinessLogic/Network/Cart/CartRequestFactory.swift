//
//  CartRequestFactory.swift
//  GBShop
//
//  Created by Аня on 07.09.2022.
//

import Foundation
import Alamofire

protocol CartRequestFactory {

    func addCart(
        item: String,
        price: Int,
        amount: Int,
        completionHandler: @escaping (AFDataResponse<AddCart>) -> Void)
    
    func makeCart(
        item: String,
        price: Int,
        amount: Int,
        bill: Int,
        completionHandler: @escaping (AFDataResponse<CartBalanse>) -> Void)
    
    func removeCart(
        item: String,
        amount: Int,
        completionHandler: @escaping (AFDataResponse<RemoveCart>) -> Void)
    
    func balanceCart(
        result: Int,
        completionHandler: @escaping (AFDataResponse<CartResult>) -> Void)
}

