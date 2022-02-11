//
//  APIClassTestCase.swift
//  OpenBank_AssignmentTests
//
//  Created by Piyush Daryapurkar on 10/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import XCTest
@testable import Marvel

class APIClassTestCase: XCTestCase {
    
    var apiClass: APIClass!
    var baseUrl = ""
    
    override func setUp() {
        apiClass = APIClass()
        baseUrl = "https://gateway.marvel.com/v1/public/"
    }

    override func tearDown() {
        apiClass = nil
    }
    
    func testGeneratingRequestWithQueryItems() throws {
        let actualUrl = apiClass.createURLFromParameters(parameters: ["q" : "110921"], pathparam: "path")
        let hardcodedUrl = URL(string:baseUrl + "path?q=110921")
        XCTAssertEqual(actualUrl,hardcodedUrl)
    }
}
