//
//  CharacterListRespository.swift
//  OpenBank_Assignment
//
//  Created by Piyush Daryapurkar on 08/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import Foundation

struct CharacterRepository {
    
    func getCharacterList(request:CharacterRequest, completion: @escaping(_ result: CharacterResponse?, _ error:String?) -> Void) {
        let dict = Configuration().getApiKeys()
        let url = APIClass.init().createURLFromParameters(parameters: ["apikey" : dict[Constants.publicApiKey] ?? "" ,"hash": request.hash,"ts":request.ts], pathparam: "characters")
        let urlRequest = URLRequest(url:url)
        
        let task = URLSession.shared.dataTask(with:urlRequest) { (data,response,error) in
            DispatchQueue.main.async {
                if error == nil {
                    guard let data = data,let response = try? JSONDecoder().decode(CharacterResponse.self, from: data)
                        else {
                            completion(nil,ErrorMessage.errorInDataObject)
                            return
                    }
                    completion(response,ErrorMessage.noError)
                }
                else {
                    completion(nil,error?.localizedDescription)
                }
            }
        }
        task.resume()
    }

    
    func getCharacterDetails(request:CharacterRequest, characterId:Int, completion: @escaping(_ result: CharacterModel?,_ error:String?) -> Void) {
        let dict = Configuration().getApiKeys()
        let url = APIClass.init().createURLFromParameters(parameters: ["apikey" : dict[Constants.publicApiKey] ?? "" ,"hash": request.hash,"ts":request.ts], pathparam:("characters/" + "\(String(characterId))"))
        let urlRequest = URLRequest(url:url)
        
        let task = URLSession.shared.dataTask(with:urlRequest) { (data,response,error) in
            DispatchQueue.main.async {
                if error == nil {
                    guard let data = data,let response = try? JSONDecoder().decode(CharacterResponse.self, from: data)
                        else {
                            completion(nil,ErrorMessage.errorInDataObject)
                            return
                    }
                    completion(response.data.results.first,ErrorMessage.noError)
                }
                else {
                    completion(nil,error?.localizedDescription)
                }
            }
        }
        task.resume()
    }
}
