//
//  CharacterRespositoryTestCase.swift
//  OpenBank_AssignmentTests
//
//  Created by Piyush Daryapurkar on 10/02/22.
//  Copyright © 2022 Piyush Daryapurkar. All rights reserved.
//

import XCTest
@testable import Marvel

class CharacterRespositoryTestCase: XCTestCase {

    var apiClass: APIClass!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiClass = APIClass()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiClass = nil
    }
    
    
    func testValidParametersInApiCall() throws {
        let testCharacterRequest = CharacterRequest.init(hash:"72e5ed53d1398abb831c3ceec263f18b", ts:"thesoer")
        let url = apiClass.createURLFromParameters(parameters: ["apikey" : "001ac6c73378bbfff488a36141458af2" ,"hash": testCharacterRequest.hash,"ts":testCharacterRequest.ts], pathparam: "characters")
        let promise = expectation(description: "Status code: 200")
        let dataTask = URLSession.shared.dataTask(with: url) { _, response, error in
            
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        wait(for: [promise], timeout:15)
    }
    
    func testInValidParametersInApiCall() throws {
        let testCharacterRequest = CharacterRequest.init(hash:"", ts:"thesoer")
        let url = apiClass.createURLFromParameters(parameters: ["apikey" : "14bb8b1b55920b49b3c100ae742dd3cf" ,"hash": testCharacterRequest.hash,"ts":testCharacterRequest.ts], pathparam: "characters")
        let promise = expectation(description: "Status code: 401")
        let dataTask = URLSession.shared.dataTask(with: url) { _, response, error in
            
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 401 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        wait(for: [promise], timeout:10)
    }
}


struct MockAppServerClient {
    
    func getCharacterListMockWithValidResponse(completion: @escaping(_ result: CharacterResponse?, _ error:String?) -> Void) {
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: "Character", withExtension: "json") else {
            return
        }
        let data = try? Data(contentsOf:url)
        let response = try? JSONDecoder().decode(CharacterResponse.self, from:data!)
        completion(response,nil)
    }
    
    func getCharacterListMockWithInValidResponse(completion: @escaping(_ result: CharacterResponse?, _ error:String?) -> Void) {
        completion(nil,ErrorMessage.errorInDataObject)
    }
    
    func getCharacterDetailsMockWithValidResponse(completion: @escaping(_ result:CharacterModel?, _ error:String?) -> Void) {
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: "Character", withExtension: "json") else {
            return
        }
        let data = try? Data(contentsOf:url)
        let response = try? JSONDecoder().decode(CharacterResponse.self, from:data!)
        completion(response?.data.results[0],nil)
    }
    
    func getCharacterDetailsMockWithInValidResponse(completion: @escaping(_ result: CharacterResponse?, _ error:String?) -> Void) {
        completion(nil,ErrorMessage.errorInDataObject)
    }
}
