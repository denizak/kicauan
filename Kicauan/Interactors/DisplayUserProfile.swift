//
//  DisplayUserProfile.swift
//  Kicauan
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import Foundation

protocol DisplayUserProfileProtocol {
    func getUserProfile(_ session: Session, _ completion: @escaping (_ user: User) -> Void)
}

struct DisplayUserProfile : DisplayUserProfileProtocol {
    
    let userProfileClient: UserProfileClientProtocol
    
    init(userProfileClient: UserProfileClientProtocol) {
        self.userProfileClient = userProfileClient
    }
    
    func getUserProfile(_ session: Session, _ completion: @escaping (User) -> Void) {
        userProfileClient.getCurrentUserProfile(with: session.userID) { user in
            completion(user.toUser())
        }
    }
}
