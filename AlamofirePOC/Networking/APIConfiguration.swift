//
//  APIConfiguration.swift
//  AlamofirePOC
//
//  Created by Ernesto Gonzalez on 5/1/19.
//  Copyright © 2019 Ernesto Gonzalez. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var headers: String { get }
    var baseURL: String { get }
    var httpMethod: HTTPMethod { get }
    var requestPath: String { get }
    var queryItems: [URLQueryItem]? { get }
    var parameters: Parameters? { get }
}

extension APIConfiguration {
    
    var headers: String {
        // Authorization token can go here
        return ""
    }
    
    var baseURL: String {
        return AppConfiguration.shared.apiURL ?? ""
    }
    
    func buildRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var urlRequest: URLRequest!
        
        if let queryItems = queryItems, var urlComponents = URLComponents(string: url.absoluteString) {
            urlComponents.path = requestPath
            urlComponents.queryItems = queryItems
            urlRequest = URLRequest(url: try urlComponents.asURL())
        } else {
            urlRequest = URLRequest(url: url.appendingPathComponent(requestPath))
        }
        
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if !headers.isEmpty {
            urlRequest.addValue(headers, forHTTPHeaderField: "<Token form OAuth could go here for example>")
        }
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
