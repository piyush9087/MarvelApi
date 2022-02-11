//
//  ReadConfiguration.swift
//  OpenBank_Assignment
//
//  Created by Piyush Daryapurkar on 09/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import Foundation

struct Configuration {
    
    func getApiKeys() -> [String:String] {
        
        if let path = Bundle.main.path(forResource:"Configuration", ofType: "plist") {
            let plist = NSDictionary(contentsOfFile: path) ?? ["":""]
            let publicKey = plist["Public_API_Key"] as! String
            let privateKey = plist["Private_API_Key"] as! String
            let dict = [Constants.publicApiKey:publicKey,Constants.privateApiKey:privateKey]
            return dict
        }
        return ["":""]
    }
}


