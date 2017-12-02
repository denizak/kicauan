//
//  TwitterUser.swift
//  Kicauan
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import TwitterKit

struct TwitterUser {
    let userID: String
    let name: String
    let userName: String
    let formattedScreenName: String
    let profileImageURL: String
}

extension TwitterUser {
    
    static func fromTwitter(_ user: TWTRUser) -> TwitterUser {
        return TwitterUser(userID: user.userID, name: user.name, userName: user.screenName, formattedScreenName: user.formattedScreenName, profileImageURL: user.profileImageURL)
    }
    
    func toUser() -> User {
        return User(userID: userID, name: name, formattedScreenName: formattedScreenName, profileImageURL: profileImageURL)
    }
    
}
