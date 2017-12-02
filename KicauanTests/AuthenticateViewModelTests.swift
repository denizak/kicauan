//
//  AuthenticateViewModelTests.swift
//  KicauanTests
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import XCTest
import RxSwift

@testable import Kicauan
class AuthenticateViewModelTests: XCTestCase {
    
    class AuthenticateSuccessMock: AuthenticateProtocol {
        func login(_ completion: @escaping (Bool, Session) -> Void) {
            completion(true, Session(token: "token", secret: "secret", userID: "100"))
        }
        
        var isAuthenticated: Bool { return true }
    }
    
    let authenticate = AuthenticateSuccessMock()
    var authViewModel: AuthenticationViewModel!
    
    override func setUp() {
        authViewModel = AuthenticationViewModel(authenticate: authenticate)
    }
    
    func testLogin() {
        let expectAuthentication = expectation(description: "authentication")
        let expectShowLoading = expectation(description: "loading")
        
        let loadingDisposable = authViewModel.showLoadingEvent
            .subscribe(onNext: { show in
                if show {
                    expectShowLoading.fulfill()
                }
            })

        let authenticationDisposable = authViewModel.authenticationSuccessEvent
            .subscribe(onNext: { (success) in
                XCTAssertTrue(success)
                expectAuthentication.fulfill()
            })
        
        authViewModel.login()
        
        waitForExpectations(timeout: 1, handler: nil)
        
        loadingDisposable.dispose()
        authenticationDisposable.dispose()
    }
    
    func testIsAuthenticated() {
        XCTAssertTrue(authViewModel.isAuthenticated)
    }
    
}
