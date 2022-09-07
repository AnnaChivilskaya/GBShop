//
//  Catalog.swift
//  GBShop
//
//  Created by Аня on 28.08.2022.
//

import Foundation
import Alamofire

class Catalog: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/catalogData.json")!
    
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

extension Catalog: CatalogRequestFactory {
    
    func catalog(result: Int,
                 idProduct: Int,
                 productName: String,
                 price: Int,
                 completionHandler: @escaping (AFDataResponse<CatalogResult>) -> Void) {
        let requestModel = catalogs(
            baseUrl: baseUrl,
            result: result,
            idProduct: idProduct,
            productName: productName,
            price: price
        )
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

extension Catalog {
    
    struct catalogs: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        let result: Int
        let idProduct: Int
        let productName: String
        let price: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
                "product_name": productName
            ]
        }
    }
}
