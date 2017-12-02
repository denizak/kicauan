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
        
        func login(_ completion: @escaping (_ session: TwitterSession) -> Void) {
            completion(TwitterSession(token: "", secret: "", userName: "", userID: AuthenticateTests.userID))
        }
        
        func logout(_ session: TwitterSession) {}
    }
    
    func testLogin() {
        let authClient = AuthenticationClient()
        let authenticate = Authenticate(authenticationClient: authClient)
        
        authenticate.login { (success, session) in
            XCTAssertTrue(success)
            XCTAssertEqual(session.userID, AuthenticateTests.userID)
        }
        
    }
    
    
    
}
