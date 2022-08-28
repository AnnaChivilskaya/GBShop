//
//  LogOutTests.swift
//  GBShopTests
//
//  Created by Аня on 28.08.2022.
//

import XCTest
@testable import GBShop

class LogOutTests: XCTestCase {
    
    private let expectationLogOut = XCTestExpectation(description: "LogOutTesting")
    private var logout: LogOutRequestFactory!
    private var isRequestPassed: Bool!
    
    override func setUp() {
        let factory = RequestFactory()
        logout = factory.makeLogOutRequestFactory()
        isRequestPassed = false
    }
    
    override  func tearDown() {
        logout = nil
        isRequestPassed = nil
    }
    
    func testLogOut() {
        let idUser = 123
       
        
       logout.logout(idUser: idUser) { [weak self] response in
            switch response.result {
            case .success(let result):
                self?.isRequestPassed = result.result == 1 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationLogOut.fulfill()
        }
        
        wait(for: [expectationLogOut], timeout: 10.0)
        
        XCTAssertTrue(isRequestPassed, "LogOut attempt haven`t succeded")
    }
    
}
