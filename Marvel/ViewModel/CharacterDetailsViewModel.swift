//
//  CharacterDetailsViewModel.swift
//  OpenBank_Assignment
//
//  Created by Piyush Daryapurkar on 09/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import Foundation

protocol CharacterDetailsViewModelDelegate {
    func didReceiveCharacterDetails(dataResponse:CharacterModel?)
    func didFailWithError(msg:String)
}

struct CharacterDetailsViewModel {
    
    var delegate:CharacterDetailsViewModelDelegate?
    // Fetch Character Details from Respository Function & Send to View 
    func fetchMarvelCharacterDetails(marvelCharacterRequest:CharacterRequest,characterId:Int) {
        CharacterRepository().getCharacterDetails(request:marvelCharacterRequest,characterId:characterId) { apiResponse,error in
            DispatchQueue.main.async {
                if error != ErrorMessage.noError {
                    self.delegate?.didFailWithError(msg:error ?? "")
                }
                else if let response = apiResponse {
                    self.delegate?.didReceiveCharacterDetails(dataResponse:response)
                }
            }
        }
    }
}
