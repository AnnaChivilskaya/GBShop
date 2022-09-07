//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Аня on 23.08.2022.
//

import Foundation

protocol AbstractErrorParser {
    
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}

