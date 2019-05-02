//
//  PerformRequestProtocol.swift
//  AlamofirePOC
//
//  Created by Ernesto Gonzalez on 5/1/19.
//  Copyright © 2019 Ernesto Gonzalez. All rights reserved.
//

import Foundation
import Alamofire

protocol PerformRequestProtocol {
    func performRequest<T: Decodable>(route: APIConfiguration, completion: @escaping (_ data: T?, _ error: Error?) -> Void)
}

extension PerformRequestProtocol {
    
    func performRequest<T>(route: APIConfiguration, completion: @escaping (T?, Error?) -> Void) where T: Decodable {
        apiRequest(route: route) { data, error in
            do {
                guard let data = data else {
                    completion(nil, error)
                    return
                }
                
                let decodableData = try JSONDecoder().decode(T.self, from: data)
                completion(decodableData, nil)
            } catch let error {
                completion(nil, error)
            }
        }
    }
    
    private func apiRequest(route: APIConfiguration, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        Alamofire.request(route).validate(statusCode: 200..<300).validate().responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else {
                    completion(nil, NSError(domain: "No data response", code: 1, userInfo: nil))
                    return
                }
                
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
