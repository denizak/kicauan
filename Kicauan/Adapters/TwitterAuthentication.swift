//
//  TwitterAuthentication.swift
//  Kicauan
//
//  Created by deni zakya on 01/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import TwitterKit

struct TwitterAuthentication : AuthenticationClientProtocol {
    var isLoggedIn: Bool {
        let sessionStore = Twitter.sharedInstance().sessionStore
        guard let _ = sessionStore.session() else { return false }
        return true
    }
    
    func login(_ completion: @escaping (_ session: TwitterSession) -> Void) {
        Twitter.sharedInstance().logIn(completion: { (session, error) in
            if let session = session {
                completion(TwitterSession.fromTwitter(session))
            } else if let error = error {
                print("error: \(error.localizedDescription)");
            }
        })
    }
    
    func logout(_ session: TwitterSession) {
        let sessionStore = Twitter.sharedInstance().sessionStore
        
        if let userID = sessionStore.session()?.userID, session.userID == userID {
            sessionStore.logOutUserID(userID)
        }
    }
}
