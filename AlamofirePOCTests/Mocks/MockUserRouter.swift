//
//  MockUserRouter.swift
//  AlamofirePOCTests
//
//  Created by Ernesto Gonzalez on 5/1/19.
//  Copyright © 2019 Ernesto Gonzalez. All rights reserved.
//

import Foundation
import Alamofire
@testable import AlamofirePOC

enum MockUserRouter: APIConfiguration {
    
    case authenticateUser(email: String, password: String)
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var baseURL: String {
        switch self {
        case .authenticateUser:
            return TestingUtilities.getMockJSONPath(resourceName: "UserRequest")
        }
    }
    
    var requestPath: String {
        return ""
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    var parameters: Parameters? {
        switch self {
        case .authenticateUser(let email, let password):
            return ["email": email, "password": password]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        return try buildRequest()
    }
}
