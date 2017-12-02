//
//  Authenticate.swift
//  Kicauan
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import Foundation

protocol AuthenticateProtocol {
    func login(_ completion: @escaping (_ success: Bool, _ session: Session) -> Void)
}

struct Authenticate : AuthenticateProtocol {
    
    private let authenticationClient: AuthenticationClientProtocol
    
    init(authenticationClient: AuthenticationClientProtocol) {
        self.authenticationClient = authenticationClient
    }
    
    func login(_ completion: @escaping (Bool, Session) -> Void) {
        self.authenticationClient.login { session in
            completion(!session.userID.isEmpty, session.toSession())
        }
    }
}

