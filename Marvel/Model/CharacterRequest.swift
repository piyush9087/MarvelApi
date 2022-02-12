//
//  MarvelCharacterListRequest.swift
//  OpenBank_Assignment
//
//  Created by Piyush Daryapurkar on 08/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import Foundation
import CommonCrypto

struct CharacterRequest:Encodable {
    let hash:String
    let ts:String
}

extension Date {
    // Get Time Stamp
    func generateTimeStamp() -> String {
        let timeStamp = NSDate().timeIntervalSince1970.description
        return timeStamp
    }
}

extension String {
    // Get HashValue Using CommonCrypto
    func generateMd5HashValue(timestamp: String) -> String {
        let dict = Configuration().getApiKeys()
        let paramString = (timestamp + (dict[Constants.privateApiKey] ?? "") + (dict[Constants.publicApiKey] ?? ""))
        let str = paramString.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(paramString.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        return String(format: hash as String)
    }
}







