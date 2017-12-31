//
//  Authenticate.swift
//  Kicauan
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import Foundation

protocol AuthenticateProtocol {
    var isAuthenticated: Bool { get }
    var currentSession: Session? { get }
    func login(_ completion: @escaping (_ success: Bool, _ session: Session) -> Void)
}

struct Authenticate : AuthenticateProtocol {
    
    private let authenticationClient: AuthenticationClientProtocol
    
    var isAuthenticated: Bool {
        return self.authenticationClient.isLoggedIn
    }
    
    var currentSession: Session? {
        return self.authenticationClient.currentSession?.toSession()
    }
    
    init(authenticationClient: AuthenticationClientProtocol) {
        self.authenticationClient = authenticationClient
    }
    
    func login(_ completion: @escaping (Bool, Session) -> Void) {
        self.authenticationClient.login { (session, error) in
            let success = error == nil
            if let session = session {
                completion(success, session.toSession())
            } else {
                completion(success, Session(token: "", secret: "", userID: ""))
            }
        }
    }
}

