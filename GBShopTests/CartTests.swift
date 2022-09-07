//
//  CartsTests.swift
//  GBShopTests
//
//  Created by Аня on 07.09.2022.
//

import XCTest
@testable import GBShop

class CartTests: XCTestCase {

    let expectationCart = XCTestExpectation(description: "CartTesting")
    var cart: CartRequestFactory!
    var isRequestPassed: Bool!
    
    override func setUpWithError() throws {
        let factory = RequestFactory()
        cart = factory.makeCartRequestFactory()
        isRequestPassed = false
    }
    
    override func tearDownWithError() throws {
        cart = nil
        isRequestPassed = nil
    }
    
    func testCart() throws {
        
        cart.makeCart(
            item: "item",
            price: 123,
            amount: 1,
            bill: 123
        ) { [weak self] response in
            switch response.result {
            case .success(let goods):
                self?.isRequestPassed = goods.response.isEmpty ? false : true
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationCart.fulfill()
        }
        wait(
            for: [expectationCart],
            timeout: 10.0
        )
        XCTAssertTrue(
            isRequestPassed,
            "Cart fetching haven't succeded."
        )
    }
    
    func testAddCart() throws {
        
        cart.addCart(
            item: "item",
            price: 123,
            amount: 1
        ) { [weak self] response in
            switch response.result {
            case .success(let goods):
                self?.isRequestPassed = goods.result == 1 ? false : true
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationCart.fulfill()
        }
        wait(
            for: [expectationCart],
            timeout: 10.0
        )
        XCTAssertTrue(
            isRequestPassed,
            "AddToCart attempt haven't succeded."
        )
    }
    
    func testRemoveCart() throws {
        
        cart.removeCart(
            item: "item",
            amount: 1
        ) { [weak self] response in
            switch response.result {
            case .success(let goods):
                self?.isRequestPassed = goods.result == 1 ? false : true
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationCart.fulfill()
        }
        wait(
            for: [expectationCart],
            timeout: 10.0
        )
        XCTAssertTrue(
            isRequestPassed,
            "RemoveFromCart attempt haven't succeded."
        )
    }
    
    func testMakeCart() throws {
        
        cart.balanceCart(
            result: 1
        ) { [weak self] response in
            switch response.result {
            case .success(let goods):
                self?.isRequestPassed = goods.result == 1 ? false : true
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationCart.fulfill()
        }
        wait(
            for: [expectationCart],
            timeout: 10.0
        )
        XCTAssertTrue(
            isRequestPassed,
            "Cart attempt haven't succeded."
        )
    }
}
