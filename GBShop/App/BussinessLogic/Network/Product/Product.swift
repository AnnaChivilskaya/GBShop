//
//  Product.swift
//  GBShop
//
//  Created by Аня on 28.08.2022.
//

import Foundation
import Alamofire

class Product: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/getGoodById.json")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Product: ProductRequestFactory {
    
    func product(result: Int,
                 productName: String,
                 productPrice: Int,
                 productDescription: String,
                 completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void) {
        let requestModel = prod(
            baseUrl: baseUrl,
            result: result,
            productName: productName,
            productPrice: productPrice,
            productDescription: productDescription
        )
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

extension Product {
    
    struct prod: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        let result: Int
        let productName: String
        let productPrice: Int
        let productDescription: String
        var parameters: Parameters? {
            return [
                "product_name": productName,
                "product_price": productPrice,
                "product_description" : productDescription
            ]
        }
    }
}
