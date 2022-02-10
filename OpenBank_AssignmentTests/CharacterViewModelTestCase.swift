//
//  CharacterViewModelTestCase.swift
//  OpenBank_AssignmentTests
//
//  Created by Piyush Daryapurkar on 10/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import XCTest
@testable import OpenBank_Assignment

class CharacterViewModelTestCase: XCTestCase {

    var viewModel:CharacterViewModel!
    
    override func setUp() {
        viewModel = CharacterViewModel()
    }

    override func tearDown() {
        viewModel = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
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

