//
//  ProductRequestFactory.swift
//  GBShop
//
//  Created by Аня on 28.08.2022.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
    
    func product(result: Int,
                 productName: String,
                 productPrice: Int,
                 productDescription: String,
                 completionHandler: @escaping(AFDataResponse<ProductResult>) -> Void)
}
