//
//  DisplayUserProfileViewModelTests.swift
//  KicauanTests
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import XCTest

@testable import Kicauan
class DisplayUserProfileViewModelTests: XCTestCase {
    
    class DisplayUserProfileMock : DisplayUserProfileProtocol {
        func getUserProfile(_ session: Session, _ completion: @escaping (User) -> Void) {
            completion(User(userID: "100", name: "name", formattedScreenName: "@name", profileImageURL: "https://image.com/image.png"))
        }
    }
    
    func testGetUserProfile() {
        let expect = expectation(description: "user")
        let displayUserProfile = DisplayUserProfileMock()
        let displayUserProfileViewModel = DisplayUserProfileViewModel(displayUserProfile: displayUserProfile)
        let session = Session(token: "token", secret: "secret", userID: "100")
        
        displayUserProfileViewModel.profileRetreiveEvent
            .subscribe(onNext: { user in
                XCTAssertEqual(user.userID, "100")
                
                expect.fulfill()
        })
        
        displayUserProfileViewModel.getUserProfile(with:session)
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
}
