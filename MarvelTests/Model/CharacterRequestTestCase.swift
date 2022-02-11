//
//  CharacterRequestTestCase.swift
//  OpenBank_AssignmentTests
//
//  Created by Piyush Daryapurkar on 10/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterRequestTestCase: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharacterRequest_canCreateInstance() {
        let instance = CharacterRequest(hash:"72e5ed53d1398abb831c3ceec263f18b", ts:"1644337031601")
        XCTAssertNotNil(instance)
    }
    
    
    
}
