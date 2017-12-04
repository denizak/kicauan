//
//  AuthenticationViewModel.swift
//  Kicauan
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

struct AuthenticationViewModel {
    
    private let authenticate : AuthenticateProtocol
    
    private let showLoading = PublishSubject<Bool>()
    private let authenticationSuccess = PublishSubject<Bool>()
    
    var showLoadingEvent: Observable<Bool> {
        return showLoading.asObservable()
    }
    
    var authenticationSuccessEvent: Observable<Bool> {
        return authenticationSuccess.asObservable()
    }
    
    var isAuthenticated: Bool {
        return self.authenticate.isAuthenticated
    }
    
    init(authenticate: AuthenticateProtocol) {
        self.authenticate = authenticate
    }
    
    func viewAppear() {
        authenticationSuccess.onNext(isAuthenticated)
    }
    
    func login() {
        showLoading.onNext(true)
        authenticate.login { (success, session) in
            self.showLoading.onNext(false)
            self.authenticationSuccess.onNext(success)
        }
    }
}
