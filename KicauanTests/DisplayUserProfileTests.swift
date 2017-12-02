//
//  DisplayUserProfileTests.swift
//  KicauanTests
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import XCTest

@testable import Kicauan
class DisplayUserProfileTests: XCTestCase {
    
    static let userID = "110"
    
    class UserProfileClient: UserProfileClientProtocol {
        func getCurrentUserProfile(with userID: String, _ completion: @escaping (_ user: TwitterUser) -> Void) {
            completion(TwitterUser(userID: userID, name: "", userName: "", formattedScreenName: "", profileImageURL: ""))
        }
    }
    
    func testGetUserProfile() {
        let expect = expectation(description: "user profile")
        let userProfileClient = UserProfileClient()
        let displayUserProfile = DisplayUserProfile(userProfileClient: userProfileClient)
        
        let session = Session(token: "", secret: "", userID: DisplayUserProfileTests.userID)
        displayUserProfile.getUserProfile(session) { user in
            expect.fulfill()
            
            XCTAssertEqual(user.userID, DisplayUserProfileTests.userID)
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
}
