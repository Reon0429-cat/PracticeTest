//
//  PracticeTestTests.swift
//  PracticeTestTests
//
//  Created by 大西玲音 on 2021/09/18.
//

import XCTest
@testable import PracticeTest

class PracticeTestTests: XCTestCase {
    
    func testAdd() {
        let mockLogger = MockLogger()
        let calculator = Calculator(logger: mockLogger)
        let expectedMessages = [
            "Start Calc.",
            "Add 1.",
            "Total is 1",
            "Finish calc."
        ]
        calculator.add(num: 1)
        XCTAssertEqual(calculator.calc(), 1)
        XCTAssertTrue(mockLogger.invokedSendLog)
        XCTAssertEqual(mockLogger.invokedSendLogCount, 4)
        XCTAssertEqual(mockLogger.sendLogProperties, expectedMessages)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
