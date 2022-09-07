//
//  Cart.swift
//  GBShopTests
//
//  Created by Аня on 07.09.2022.
//

import Foundation
import Alamofire

class Cart: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://spooky-grave-35816.herokuapp.com/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension Cart: CartRequestFactory {
    
    func addCart(
        item: String,
        price: Int,
        amount: Int,
        completionHandler: @escaping (AFDataResponse<AddCart>
        ) -> Void) {
        let requestModel = AddCart(
            baseUrl: baseUrl,
            item: item,
            price: price,
            amount: amount
        )
        self.request(
            request: requestModel as URLRequestConvertible,
            completionHandler: completionHandler
        )
    }
    
    func makeCart(
        item: String,
        price: Int,
        amount: Int,
        bill: Int,
        completionHandler: @escaping (AFDataResponse<BalanceCart>
        ) -> Void) {
        let requestModel = BalanceCart(
            item: item,
            price: price,
            amount: amount,
            bill: bill
        )
        self.request(
            request: requestModel as! URLRequestConvertible,
            completionHandler: completionHandler
        )
    }
    
    func removeCart(
        item: String,
        amount: Int,
        completionHandler: @escaping (AFDataResponse<RemoveCart>
        ) -> Void) {
        let requestModel = RemoveCart(
            baseUrl: baseUrl,
            item: item,
            amount: amount
        )
        self.request(
            request: requestModel as URLRequestConvertible,
            completionHandler: completionHandler
        )
    }
    
    func balanceCart(
        result: Int,
        completionHandler: @escaping (AFDataResponse<CartResult>
        ) -> Void) {
        let requestModel = BalanceCart(
            baseUrl: baseUrl,
            result: result
        )
        self.request(
            request: requestModel as URLRequestConvertible,
            completionHandler: completionHandler
        )
    }
}

extension Cart {
    
    struct AddCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "dummyAddToCart.json"
        let item: String
        let price: Int
        let amount: Int
        var parameters: Parameters? {
            return [
                "product_name": item,
                "product_price": price,
                "amount": amount
            ]
        }
    }
    
    struct Cart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "dummyCart"
        let item: String
        let price: Int
        let amount: Int
        let bill: Int
        var parameters: Parameters? {
            return [
                "product_name": item,
                "product_price": price,
                "amount": amount,
                "bill": bill
            ]
        }
    }
    
    struct RemoveCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "dummyRemoveFromCart.json"
        let item: String
        let amount: Int
        var parameters: Parameters? {
            return [
                "product_name": item,
                "amount": amount
            ]
        }
    }
    
    struct BalanceCart: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "payment"
        let result: Int
        var parameters: Parameters? {
            return [
                "result": result
            ]
        }
    }
}




