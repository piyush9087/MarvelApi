//
//  CharacterDetailsViewModelTestCase.swift
//  OpenBank_AssignmentTests
//
//  Created by Piyush Daryapurkar on 10/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterDetailsViewModelTestCase: XCTestCase {

    var viewModel:CharacterDetailsViewModel!
    
    override func setUp() {
        viewModel = CharacterDetailsViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
    func testValidResponse() {
        let appServerClient = MockAppServerClient()
        appServerClient.getCharacterDetailsMockWithValidResponse() { mockResponse,error  in
            if error != ErrorMessage.noError {
                XCTAssertNotNil(mockResponse)
                XCTAssertNil(error)
                
            }
        }
    }
    
    func testInValidResponse() {
        let appServerClient = MockAppServerClient()
        appServerClient.getCharacterDetailsMockWithInValidResponse() { mockResponse,error  in
            if error != ErrorMessage.noError {
                XCTAssertNil(mockResponse)
                XCTAssertNotNil(error)
            }
        }
    }
}
