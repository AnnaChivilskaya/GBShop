//
//  Registration.swift
//  GBShop
//
//  Created by Аня on 23.08.2022.
//

import Foundation
import Alamofire
import SwiftUI

class Registration: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)
    ) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}
extension Registration: RegistrationRequestFactory {
    
    func register(
        idUser: Int,
        userName: String,
        password: String,
        email: String,
        genger: String,
        creditCard: String,
        bio: String, completionHandler: @escaping (AFDataResponse<RegistationResult>) -> Void) {
        let requestModel = Registr(
            baseUrl: baseUrl,
            userID: idUser,
            username: userName,
            password: password,
            email: email,
            gender: genger,
            creditCard: creditCard,
            bio: bio
        )
        self.request(request: requestModel, completionHandler: completionHandler)
        }
    
    }
    
    
extension Registration {

    struct Registr: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        let userID: Int
        let username: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id_user": userID,
                "username": username,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }
}


