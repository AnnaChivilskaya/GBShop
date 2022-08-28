//
//  ChangesTests.swift
//  GBShopTests
//
//  Created by Аня on 28.08.2022.
//

import XCTest
@testable import GBShop

class ChangesTests: XCTestCase {
    
    private let expectationChanges = XCTestExpectation(description: "ChangesTesting")
    private var changes: ChangesRequestFactory!
    private var isRequestPassed: Bool!
    
    override func setUp() {
        let factory = RequestFactory()
        changes = factory.makeChangesRequestFactory()
        isRequestPassed = false
    }
    
    override  func tearDown() {
        changes = nil
        isRequestPassed = nil
    }
    
    func testChanges() {
        
        let idUser = 123
        let userName = "Somebody"
        let password = "mypassword"
        let email = "some@gmail.com"
        let gender = "female"
        let creditCard = "123 456 789 101112"
        let bio = "bio"
        
        
        changes.changes(idUser: idUser,
                        username: userName,
                        password: password,
                        email: email,
                        gender: gender,
                        creditCard: creditCard,
                        bio: bio)
        { [weak self] response in
            switch response.result {
            case .success(let result):
                self?.isRequestPassed = result.result == 1 ? true : false
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationChanges.fulfill()
        }
        
        wait(for: [expectationChanges], timeout: 10.0)
        
        XCTAssertTrue(isRequestPassed, "Changes attempt haven`t succeded")
    }
    
}
