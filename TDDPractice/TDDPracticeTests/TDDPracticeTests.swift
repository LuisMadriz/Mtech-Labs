//
//  TDDPracticeTests.swift
//  TDDPracticeTests
//
//  Created by Luis Madriz on 3/8/22.
//

import XCTest
@testable import TDDPractice

class TDDPracticeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func test_Person_Init_SetsRequiredParameters() {
        let person = Person(name: "Todd")
        XCTAssert(person.name == "Todd")
    }
    
    func test_Person_Init_SetsADifferentParameter() {
        let person = Person(name: "Sally")
        XCTAssert(person.name == "Sally")
    }
    
    func test_Person_ModifyName() {
        var person = Person(name: "Gary")
        person.name = "Jane"
        XCTAssert(person.name == "Jane")
    }
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
