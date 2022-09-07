//
//  AuthTests.swift
//  GBShopTests
//
//  Created by Аня on 28.08.2022.
//

import XCTest
@testable import GBShop

class AuthTests: XCTestCase {
    
    private let expectationLogin = XCTestExpectation(description: "AuthTesting")
    private var auth: AuthRequestFactory!
    private var isRequestPassed: Bool!
    
    override func setUp() {
        let factory = RequestFactory()
        auth = factory.makeAuthRequestFatory()
        isRequestPassed = false
    }
    
    override  func tearDown() {
        auth = nil
        isRequestPassed = nil
    }
    
    func testAuth() {
        let userName = "Somebody"
        let password = "mypassword"
        
        auth.login(userName: userName, password: password) { [weak self] response in
            switch response.result {
            case .success(let result):
                self?.isRequestPassed = result.result == 1 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationLogin.fulfill()
        }
        
        wait(for: [expectationLogin], timeout: 10.0)
        
        XCTAssertTrue(isRequestPassed, "Login attempt haven`t succeded")
    }
    
}
