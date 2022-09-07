//
//  ReviewsTests.swift
//  GBShopTests
//
//  Created by Аня on 05.09.2022.
//

import XCTest
@testable import GBShop

class ReviewsTests: XCTestCase {

    let expectationReviews = XCTestExpectation(description: "ReviewsTesting")
    var reviews: ReviewsRequestFactory!
    var isRequestPassed: Bool!
    
    override func setUpWithError() throws {
        let factory = RequestFactory()
        reviews = factory.makeReviewsRequestFactory()
        isRequestPassed = false
    }
    
    override func tearDownWithError() throws {
        reviews = nil
        isRequestPassed = nil
    }
    
    func testReview() throws {
        
        reviews.makeReviewResult(list: ReviewResult.init(list: "message")) { [weak self] response in
            switch response.result {
            case .success(let reviews):
                self?.isRequestPassed = reviews.response.isEmpty ? false : true
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationReviews.fulfill()
        }
        wait(
            for: [expectationReviews],
            timeout: 10.0
        )
        XCTAssertTrue(
            isRequestPassed,
            "Reviews list fetching haven't succeded."
        )
    }
    
    func testAddReviews() throws {
        
        reviews.addReviews(
            message: "message"
        ) { [weak self] response in
            switch response.result {
            case .success(let reviews):
                self?.isRequestPassed = reviews.message.isEmpty ? false : true
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationReviews.fulfill()
        }
        wait(
            for: [expectationReviews],
            timeout: 10.0
        )
        XCTAssertTrue(
            isRequestPassed,
            "AddReviews attempt haven't succeded."
        )
    }
    
    func testRemoveReview() throws {
        
        reviews.removeReviews(
            result: 1
        ) { [weak self] response in
            switch response.result {
            case .success(let reviews):
                self?.isRequestPassed = reviews.result == 1 ? false : true
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self?.expectationReviews.fulfill()
        }
        wait(
            for: [expectationReviews],
            timeout: 10.0
        )
        XCTAssertTrue(
            isRequestPassed,
            "RemoveReview attempt haven't succeded."
        )
    }
}
