//
//  APIClass.swift
//  OpenBank_Assignment
//
//  Created by Piyush Daryapurkar on 08/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import Foundation

struct APIDetails {
    static let APIScheme = "https"
    static let APIHost = "gateway.marvel.com"
    static let APIPath = "/v1/public/"
}

class APIClass {
    
    func createURLFromParameters(parameters: [String:Any], pathparam: String?) -> URL {
        var components = URLComponents()
        components.scheme = APIDetails.APIScheme
        components.host   = APIDetails.APIHost
        components.path   = APIDetails.APIPath
        
        if let paramPath = pathparam {
            components.path = APIDetails.APIPath + "\(paramPath)"
        }
        if !parameters.isEmpty {
            components.queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                components.queryItems!.append(queryItem)
            }
        }
        return components.url!
    }
}

