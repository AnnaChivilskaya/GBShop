//
//  LogOut.swift
//  GBShop
//
//  Created by Аня on 23.08.2022.
//

import Alamofire
import Foundation

class LogOut: AbstractRequestFactory {
    
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

extension LogOut: LogOutRequestFactory {
    
    func logout(
        idUser: Int,
        completionHandler: @escaping (AFDataResponse<LogOutResult>) -> Void) {
            let requestModel = Out(
                baseUrl: baseUrl,
                userID: idUser
            )
            self.request(request:  requestModel, completionHandler: completionHandler)
        }
}

extension LogOut {
    
    struct Out: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        let userID: Int
        var parameters: Parameters? {
            return [
                "id_user": userID
            ]
        }
    }
}
