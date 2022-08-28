//
//  CatalogTests.swift
//  GBShopTests
//
//  Created by Аня on 28.08.2022.
//

import XCTest
@testable import GBShop

class CatalogTests: XCTestCase {
    
    private let expectationCatalog = XCTestExpectation(description: "CatalogTesting")
    private var catalog: CatalogRequestFactory!
    private var isRequestPassed: Bool!
    
    override func setUp() {
        let factory = RequestFactory()
        catalog = factory.makeCatalogRequestFactory()
        isRequestPassed = false
    }
    
    override  func tearDown() {
        catalog = nil
        isRequestPassed = nil
    }
    
    func testCatalog() {
        let result = 22
        let idProduct = 654321
        let productName = "productName"
        let price = 99
        
        catalog.catalog(result: result,
                        idProduct: idProduct,
                        productName: productName,
                        price: price)
        { [weak self] response in
            switch response.result {
            case .success(let catalog):
                self?.isRequestPassed = catalog.productName.isEmpty ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationCatalog.fulfill()
        }
        
        wait(for: [expectationCatalog], timeout: 10.0)
        
        XCTAssertTrue(isRequestPassed, "Not catalog")
    }
    
}
