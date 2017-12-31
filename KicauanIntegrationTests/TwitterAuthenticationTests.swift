//
//  TwitterLoginTests.swift
//  KicauanIntegrationTests
//
//  Created by deni zakya on 01/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import XCTest

@testable import Kicauan
class TwitterAuthenticationTests: XCTestCase {
    
    func testLogin() {
        let expect = expectation(description: "Wait login twitter")
        
        let twitterAuth = TwitterAuthentication()
        twitterAuth.login { (session, error) in
            XCTAssertFalse(session!.userID.isEmpty)
            
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 160, handler: nil)
    }
    
    func testIsLoggedIn() {
        let twitterAuth = TwitterAuthentication()
        XCTAssertTrue(twitterAuth.isLoggedIn)
    }
    
    func testGetCurrentSession() {
        let twitterAuth = TwitterAuthentication()
        XCTAssertNotNil(twitterAuth.currentSession)
        XCTAssertFalse(twitterAuth.currentSession!.userID.isEmpty)
    }
}
