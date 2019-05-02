//
//  UserRouter.swift
//  AlamofirePOC
//
//  Created by Ernesto Gonzalez on 5/1/19.
//  Copyright © 2019 Ernesto Gonzalez. All rights reserved.
//

import Foundation
import Alamofire

enum UserRouter: APIConfiguration {
    
    case login(email: String, password: String)
    case getUser(id: Int)
    case editEmail(currentEmail: String, newEmail: String)
    case changePassword(oldPassword: String, newPassword: String)
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login, .editEmail, .changePassword:
            return .post
        case .getUser:
            return .get
        }
    }
    
    var requestPath: String {
        switch self {
        case .login:
            return "/user/login"
        case .getUser:
            return "/user"
        case .editEmail:
            return "/user/update/email"
        case .changePassword:
            return "/user/change/password"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return ["email": email, "password": password]
        case .getUser:
            return nil
        case .editEmail(let currentEmail, let newEmail):
            return ["currentEmail": currentEmail, "newEmail": newEmail]
        case .changePassword(let oldPassword, let newPassword):
            return ["oldPassword": oldPassword, "newPassword": newPassword]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        return try buildRequest()
    }
}
