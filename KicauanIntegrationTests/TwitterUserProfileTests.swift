//
//  TwitterUserProfileTests.swift
//  KicauanIntegrationTests
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import XCTest

@testable import Kicauan
class TwitterUserProfileTests: XCTestCase {
    
    func testGetUserProfile() {
        let expect = expectation(description: "Get User Profile")
        
        let userID = "<your user id>"
        
        let twitterUserProfile = TwitterUserProfile()
        
        twitterUserProfile.getCurrentUserProfile(with: userID) { user in
            expect.fulfill()
            
            XCTAssertEqual(user.userID, userID)
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
