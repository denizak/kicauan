//
//  DisplayUserProfileViewModel.swift
//  Kicauan
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import Foundation

import RxSwift

struct DisplayUserProfileViewModel {
    
    let displayUserProfile: DisplayUserProfileProtocol
    
    private let userProfile = PublishSubject<User>();
    
    var profileRetreiveEvent: Observable<User> {
        return userProfile.asObservable()
    }
    
    init(displayUserProfile: DisplayUserProfileProtocol) {
        self.displayUserProfile = displayUserProfile
    }

    func getUserProfile(with session:Session) {
        displayUserProfile.getUserProfile(session) { user in
            self.userProfile.onNext(user)
        }
    }
}
