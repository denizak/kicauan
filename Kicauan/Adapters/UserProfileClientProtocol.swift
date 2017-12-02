//
//  UserProfileClientProtocol.swift
//  Kicauan
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

protocol UserProfileClientProtocol {
    func getCurrentUserProfile(with userID: String, _ completion: @escaping (_ user: TwitterUser) -> Void)
}
