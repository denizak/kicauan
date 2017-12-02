//
//  TwitterUserProfile.swift
//  Kicauan
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import Foundation

import TwitterKit

protocol TwitterUserProfileProtocol {
    func getCurrentUserProfile(with userID: String, _ completion: @escaping (_ user: TwitterUser) -> Void)
}

struct TwitterUserProfile: TwitterUserProfileProtocol {
    func getCurrentUserProfile(with userID: String, _ completion: @escaping (TwitterUser) -> Void) {
        TWTRAPIClient.withCurrentUser().loadUser(withID: userID) { (user, error) in
            guard let user = user else { return }
            
            let twitterUser = TwitterUser.fromTwitter(user)
            
            completion(twitterUser)
        }
    }
}
