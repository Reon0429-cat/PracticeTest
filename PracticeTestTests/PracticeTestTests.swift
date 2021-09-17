//
//  PracticeTestTests.swift
//  PracticeTestTests
//
//  Created by 大西玲音 on 2021/09/18.
//

import XCTest
@testable import PracticeTest

class PracticeTestTests: XCTestCase {
    
    
    
    
    func testShowLoginDialog_ログイン済み() {
        let stubAuthManager = StubAuthManager()
        stubAuthManager.isLoggedIn = true
        let dialogManager = DialogManager(authManager: stubAuthManager)
        XCTAssertFalse(dialogManager.shouldShowLoginDialog)
    }
    
    func testShowLoginDialog_未ログイン() {
        let stubAuthManager = StubAuthManager()
        stubAuthManager.isLoggedIn = false
        let dialogManager = DialogManager(authManager: stubAuthManager)
        XCTAssertTrue(dialogManager.shouldShowLoginDialog)
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
