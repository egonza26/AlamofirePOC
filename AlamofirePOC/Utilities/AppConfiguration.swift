//
//  AppConfiguration.swift
//  AlamofirePOC
//
//  Created by Ernesto Gonzalez on 5/1/19.
//  Copyright © 2019 Ernesto Gonzalez. All rights reserved.
//

import Foundation

struct AppConfiguration {
    
    static var shared = AppConfiguration()
    private init() { }
    
    private var appConfigurationPlist: [AnyHashable: Any]? {
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let plist = NSDictionary(contentsOfFile: path) as? [AnyHashable: Any],
            let settings = plist["AppConfiguration"] as? [AnyHashable: Any] else { return nil }
        return settings
    }
    
    var apiURL: String? {
        guard let configurationPlist = appConfigurationPlist, let apiURL = configurationPlist["BaseURL"] as? String else {
            return nil
        }
        
        return apiURL
    }
}
