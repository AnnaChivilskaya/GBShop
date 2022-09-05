//
//  CatalogRequestFactory.swift
//  GBShop
//
//  Created by Аня on 28.08.2022.
//

import Foundation
import Alamofire

protocol CatalogRequestFactory {
    
    func catalog(result: Int,
                 idProduct: Int,
                 productName: String,
                 price: Int,
                 completionHandler: @escaping(AFDataResponse<CatalogResult>) -> Void)
}
