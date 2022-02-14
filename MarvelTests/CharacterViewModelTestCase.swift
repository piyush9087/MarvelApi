//
//  CharacterViewModelTestCase.swift
//  OpenBank_AssignmentTests
//
//  Created by Piyush Daryapurkar on 10/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterViewModelTestCase: XCTestCase {

    var viewModel:CharacterViewModel!
    var respository:CharacterRepository!
    
    override func setUp() {
        viewModel = CharacterViewModel()
        respository = CharacterRepository()
    }

    override func tearDown() {
        viewModel = nil
    }

    
    func testValidResponse() {
        let appServerClient = MockAppServerClient()
        appServerClient.getCharacterListMockWithValidResponse() { mockResponse,error  in
          if error != ErrorMessage.noError {
             XCTAssertNotNil(mockResponse)
             XCTAssertNil(error)
            
          }
       }
    }
    
    func testInValidResponse() {
        let appServerClient = MockAppServerClient()
        appServerClient.getCharacterListMockWithInValidResponse() { mockResponse,error  in
            if error != ErrorMessage.noError {
                XCTAssertNil(mockResponse)
                XCTAssertNotNil(error)
            }
        }
    }
}

