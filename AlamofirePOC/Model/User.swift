//
//  User.swift
//  AlamofirePOC
//
//  Created by Ernesto Gonzalez on 5/1/19.
//  Copyright © 2019 Ernesto Gonzalez. All rights reserved.
//

import Foundation

struct User {
    
    var encryptedUserId = ""
    var firstName = ""
    var lastName = ""
    var email = ""
    var profileImageURL = ""
    
    private enum CodingKeys: String, CodingKey {
        case encryptedUserId
        case firstName
        case lastName
        case email
        case profileImageURL = "profileImgUrl"
        case password
    }
}

extension User: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        encryptedUserId = try container.decode(String.self, forKey: .encryptedUserId)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        email = try container.decode(String.self, forKey: .email)
        profileImageURL = try container.decode(String.self, forKey: .profileImageURL)
    }
}

