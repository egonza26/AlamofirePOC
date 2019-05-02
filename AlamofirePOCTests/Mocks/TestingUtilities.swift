//
//  TestingUtilities.swift
//  AlamofirePOCTests
//
//  Created by Ernesto Gonzalez on 5/1/19.
//  Copyright © 2019 Ernesto Gonzalez. All rights reserved.
//

import Foundation

struct TestingUtilities {
    
    static func getMockJSONPath(resourceName: String) -> String {
        guard let bundle = Bundle(identifier: "com.ernestoglz.AlamofirePOCTests"),
            let path = bundle.path(forResource: resourceName, ofType: "json") else {
                return ""
        }
        
        return URL(fileURLWithPath: path).absoluteString
    }
}
