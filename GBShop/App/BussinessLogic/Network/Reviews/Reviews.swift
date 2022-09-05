//
//  Reviews.swift
//  GBShop
//
//  Created by Аня on 05.09.2022.
//

import Foundation
import Alamofire

class Reviews: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://spooky-grave-35816.herokuapp.com/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension Reviews: ReviewsRequestFactory {
    
    func addReviews(
        message: String,
        completionHandler: @escaping (AFDataResponse<Review>) -> Void) {
            let requestModel = AddReview(baseUrl: baseUrl, message: message)
//            self.request(request: requestModel, completionHandler: completionHandler)
        }
    
    func makeReviewResult(
        list: ReviewResult,
        completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void) {
            let requestModel = Review(baseUrl: baseUrl, list: list)
//            self.request(request: requestModel, completionHandler: completionHandler)
        }
    
    func removeReviews(
        result: Int,
        completionHandler: @escaping (AFDataResponse<RemoveReview>) -> Void) {
            let requestModel = RemoveReview(baseUrl: baseUrl, result: result)
//            self.request(request: requestModel, completionHandler: completionHandler)
        }
}

extension Reviews {
    
    struct AddReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "dummyAddReview.json"
        let message: String
        var parameters: Parameters? {
            return [
                "message": message,
            ]
        }
    }
    
    struct Review: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "dummyReviews"
        let list: ReviewResult
        var parameters: Parameters? {
            return [
                "ReviewsList.json": list,
            ]
        }
    }
    
    struct RemoveReview: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "dummyRemoveReview.json"
        let result: Int
        var parameters: Parameters? {
            return [
                "result": result
            ]
        }
    }
}

