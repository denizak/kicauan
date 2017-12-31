//
//  AuthenticateTests.swift
//  KicauanTests
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import XCTest

@testable import Kicauan
class AuthenticateTests: XCTestCase {
    
    static let userID = "100"
    
    class AuthenticationClient : AuthenticationClientProtocol {
        var currentSession: TwitterSession? { return nil }
        
        var isLoggedIn: Bool { return true }
        
        func login(_ completion: @escaping (_ session: TwitterSession?, _ error: Error?) -> Void) {
            completion(TwitterSession(token: "", secret: "", userID: AuthenticateTests.userID), nil)
        }
        
        func logout(_ session: TwitterSession) {}
    }
    
    let authClient = AuthenticationClient()
    var authenticate: Authenticate!
    
    override func setUp() {
        authenticate = Authenticate(authenticationClient: authClient)
    }
    
    func testLogin() {
        let expect = expectation(description: "login")
        
        authenticate.login { (success, session) in
            expect.fulfill()
            
            XCTAssertTrue(success)
            XCTAssertEqual(session.userID, AuthenticateTests.userID)
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testIsAuthenticated() {
        XCTAssertTrue(authenticate.isAuthenticated)
    }
    
}
