//
//  CharacterViewModel.swift
//  OpenBank_Assignment
//
//  Created by Piyush Daryapurkar on 08/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import Foundation

protocol CharacterViewModelDelegate {
    func didReceiveResponse(dataResponse:[CharacterModel]?)
    func didFailWithError(msg:String)
}

struct CharacterViewModel {
    
    var delegate:CharacterViewModelDelegate?
    // Fetch Character List from Respository Function & Send to View 
    func fetchMarvelCharacters(marvelCharacterRequest:CharacterRequest) {
        CharacterRepository().getCharacterList(request:marvelCharacterRequest) { apiResponse,error  in
            DispatchQueue.main.async {
                if error != ErrorMessage.noError {
                    self.delegate?.didFailWithError(msg:error ?? "")
                }
                else if let response = apiResponse {
                    self.delegate?.didReceiveResponse(dataResponse:response.data.results)
                }
            }
        }
    }
}
