//
//  Character.swift
//  OpenBank_Assignment
//
//  Created by Piyush Daryapurkar on 08/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import Foundation

struct CharacterResponse:Decodable {
    let data:Result
}

class Result:Decodable {
    let results:[CharacterModel]
}

struct CharacterModel:Decodable {
    let id:Int
    let name:String
    let description:String
    let thumbnail:Thumbnail
    
}

struct Thumbnail:Decodable {
    let path:String
    let imageExtension:String
    
    private enum CodingKeys : String, CodingKey {
        case path,imageExtension = "extension"
    }
    
}
