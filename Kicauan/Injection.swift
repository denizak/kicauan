//
//  Injection.swift
//  Kicauan
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        
        defaultContainer.register(AuthenticationClientProtocol.self) { resolver in
            return TwitterAuthentication()
        }
        
        defaultContainer.register(AuthenticateProtocol.self) { resolver in
            return Authenticate(authenticationClient: resolver.resolve(AuthenticationClientProtocol.self)!)
        }
        
        defaultContainer.register(AuthenticationViewModel.self) { resolver in
            return AuthenticationViewModel(authenticate: resolver.resolve(AuthenticateProtocol.self)!)
        }
        
        defaultContainer.storyboardInitCompleted(TimelineViewController.self) { resolver, controller in
            controller.authenticationViewModel = resolver.resolve(AuthenticationViewModel.self)
        }

        defaultContainer.storyboardInitCompleted(MainNavigationController.self) { _,_ in }
    }
    
}

