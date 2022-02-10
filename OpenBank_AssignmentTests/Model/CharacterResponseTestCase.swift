//
//  CharacterResponseTestCase.swift
//  OpenBank_AssignmentTests
//
//  Created by Piyush Daryapurkar on 10/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import XCTest
@testable import OpenBank_Assignment

class CharacterResponseTestCase: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    func testCharacterResponse_MapJson() throws {
        //let bundle = Bundle.main
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Character", withExtension: "json") else {
            XCTFail("Missing file: Character.json")
            return
        }
        
        let data = try Data(contentsOf: url)
        let response = try? JSONDecoder().decode(CharacterResponse.self, from:data)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.data.results[0].name, "3-D Man")
        XCTAssertEqual(response?.data.results[0].id, 1011334)
    }
}
