//
//  AppDelegate.swift
//  GBShop
//
//  Created by Аня on 18.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let requestFactory = RequestFactory()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let logout = requestFactory.makeLogOutRequestFactory()
        logout.logout(idUser: 123) { response in
            switch response.result {
            case .success(let logout):
                print(logout)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let change = requestFactory.makeChangesRequestFactory()
        change.changes(idUser: 123, username: "Somebody", password: "mypassword", email: "some@gmail.com", gender: "female", creditCard: "123 456 789 101112", bio: "bio") { response in
            switch response.result {
            case .success(let change):
                print(change)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let registration = requestFactory.makeRegistrationRequestFactory()
        registration.register(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@gmail.com", genger: "female", creditCard: "123 456 789 101112", bio: "bio") { response in
            switch response.result {
            case .success(let registration):
                print(registration)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let catalog = requestFactory.makeCatalogRequestFactory()
        catalog.catalog(result: 22, idProduct: 654321, productName: "productName", price: 99) { response in
            switch response.result {
            case .success(let catalog):
                print(catalog)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let product = requestFactory.makeProductRequestFactory()
        product.product(result: 22, productName: "productName", productPrice: 99, productDescription: "description") { response in
            switch response.result {
            case .success(let product):
                print(product)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        return true
    }
}


