//
//  ReviewsRequestFactory.swift
//  GBShop
//
//  Created by Аня on 05.09.2022.
//

import Foundation
import Alamofire

protocol ReviewsRequestFactory {

    func addReviews(
        message: String,
        completionHandler: @escaping (AFDataResponse<Review>) -> Void)
    
    func makeReviewResult(
        list: ReviewResult,
        completionHandler: @escaping (AFDataResponse<ReviewResult>) -> Void)
    
    func removeReviews(
        result: Int,
        completionHandler: @escaping (AFDataResponse<RemoveReview>) -> Void)
}

