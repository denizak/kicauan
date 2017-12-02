//
//  TwitterLoginTests.swift
//  KicauanIntegrationTests
//
//  Created by deni zakya on 01/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import XCTest

import TwitterKit

@testable import Kicauan
class TwitterAuthenticationTests: XCTestCase {
    
    func testLogin() {
        let expect = expectation(description: "Wait login twitter")
        
        let twitterAuth = TwitterAuthentication()
        twitterAuth.login { session in
            XCTAssertFalse(session.userName.isEmpty)
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 160, handler: nil)
    }
    
}
