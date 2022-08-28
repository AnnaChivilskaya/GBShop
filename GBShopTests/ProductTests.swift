//
//  ProductTests.swift
//  GBShopTests
//
//  Created by Аня on 28.08.2022.
//

import XCTest
@testable import GBShop

class ProductTests: XCTestCase {
    
    private let expectationProduct = XCTestExpectation(description: "ProductTesting")
    private var product: ProductRequestFactory!
    private var isRequestPassed: Bool!
    
    override func setUp() {
        let factory = RequestFactory()
        product = factory.makeProductRequestFactory()
        isRequestPassed = false
    }
    
    override  func tearDown() {
        product = nil
        isRequestPassed = nil
    }
    
    func testCatalog() {
        let result = 22
        let productName = "productName"
        let productPrice = 99
        let productDescription = "description"
        
        
        product.product(result: result, productName: productName, productPrice: productPrice, productDescription: productDescription)
        { [weak self] response in
            switch response.result {
            case .success(let product):
                self?.isRequestPassed = product.productName.isEmpty ? false : true
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationProduct.fulfill()
        }
        
        wait(for: [expectationProduct], timeout: 10.0)
        
        XCTAssertTrue(isRequestPassed, "Not prouct")
    }
    
}
