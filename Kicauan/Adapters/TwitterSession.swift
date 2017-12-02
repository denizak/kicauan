//
//  TwitterSession.swift
//  Kicauan
//
//  Created by deni zakya on 01/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import Foundation
import TwitterKit

struct TwitterSession {
    let token: String
    let secret: String
    let userName: String
    let userID: String
}

extension TwitterSession {
    
    static func fromTwitter(_ session: TWTRSession) -> TwitterSession {
        return TwitterSession(token: session.authToken, secret: session.authTokenSecret, userName: session.userName, userID: session.userID)
    }
    
}
