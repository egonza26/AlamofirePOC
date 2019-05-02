//
//  ClientService.swift
//  AlamofirePOC
//
//  Created by Ernesto Gonzalez on 5/1/19.
//  Copyright © 2019 Ernesto Gonzalez. All rights reserved.
//

import Foundation

class ClientServices: PerformRequestProtocol {
    
    static let shared = ClientServices()
    private init() { }
    
    func authenticateUser(configuration: APIConfiguration,
                          completion: @escaping (_ result: [String: UserSession]?, _ error: Error?) -> Void) {
        performRequest(route: configuration, completion: completion)
    }
    
    func getUser(configuration: APIConfiguration, completion: @escaping (_ result: User?, _ error: Error?) -> Void) {
        performRequest(route: configuration, completion: completion)
    }
}
