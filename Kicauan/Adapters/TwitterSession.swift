//
//  TwitterSession.swift
//  Kicauan
//
//  Created by deni zakya on 01/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import TwitterKit

struct TwitterSession {
    let token: String
    let secret: String
    let userID: String
}

extension TwitterSession {
    
    static func fromTwitter(_ session: TWTRAuthSession) -> TwitterSession {
        return TwitterSession(token: session.authToken, secret: session.authTokenSecret, userID: session.userID)
    }
    
    func toSession() -> Session {
        return Session(token: token, secret: secret, userID: userID)
    }
}
