//
//  UserSession.swift
//  AlamofirePOC
//
//  Created by Ernesto Gonzalez on 5/1/19.
//  Copyright © 2019 Ernesto Gonzalez. All rights reserved.
//

import Foundation

struct UserSession {
    
    var token: String
    var userInfo: User
    
    private enum CodingKeys: String, CodingKey {
        case token
        case userInfo
    }
}

extension UserSession: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        token = try container.decode(String.self, forKey: .token)
        userInfo = try container.decode(User.self, forKey: .userInfo)
    }
}
