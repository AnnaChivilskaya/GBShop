//
//  RegistrationTests.swift
//  GBShopTests
//
//  Created by Аня on 28.08.2022.
//

import XCTest
@testable import GBShop

class RegistrationTests: XCTestCase {
    
    private let expectationRegistration = XCTestExpectation(description: "RegistrationTesting")
    private var registration: RegistrationRequestFactory!
    private var isRequestPassed: Bool!
    
    override func setUp() {
        let factory = RequestFactory()
        registration = factory.makeRegistrationRequestFactory()
        isRequestPassed = false
    }
    
    override  func tearDown() {
        registration = nil
        isRequestPassed = nil
    }
    
    func testRegistration() {
        
        let idUser = 123
        let userName = "Somebody"
        let password = "mypassword"
        let email = "some@gmail.com"
        let gender = "female"
        let creditCard = "123 456 789 101112"
        let bio = "bio"
        
        
        registration.register(idUser: idUser,
                              userName: userName,
                              password: password,
                              email: email,
                              genger: gender,
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
            self?.expectationRegistration.fulfill()
        }
        
        wait(for: [expectationRegistration], timeout: 10.0)
        
        XCTAssertTrue(isRequestPassed, "Registration attempt haven`t succeded")
    }
    
}
