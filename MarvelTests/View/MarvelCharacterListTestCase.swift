//
//  MarvelCharacterListTestCase.swift
//  OpenBank_AssignmentTests
//
//  Created by Piyush Daryapurkar on 09/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import XCTest
@testable import Marvel

class MarvelCharacterListTestCase: XCTestCase {
    
    var vc: MarvelCharacterListViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.vc = storyboard.instantiateViewController(withIdentifier:StoryBoardIdentifiers.characterListVC) as? MarvelCharacterListViewController
        
        self.vc.loadView()
        self.vc.viewDidLoad()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vc = nil
    }

    func test_tableviewConformDataSourceProtocolMethods_Returns_success() {
        
        XCTAssertTrue(vc.responds(to: #selector(vc.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(vc.responds(to: #selector(vc.tableView(_:cellForRowAt:))))
    }
    
    func testTableViewCellHasReuseIdentifier() {
        let cell = vc.tableView(vc.marvelCharacterTableview, cellForRowAt:IndexPath(row:0, section:0))
        let actualReuseIdentifer = cell.reuseIdentifier
        let expectedReuseIdentifier = CellIdentifiers.characterCell
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
}
