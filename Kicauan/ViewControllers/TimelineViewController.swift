//
//  TimelineViewController.swift
//  Kicauan
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import Foundation
import UIKit

class TimelineViewController: UIViewController {
    
    var authenticationViewModel: AuthenticationViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.leftBarButtonItem = leftBarButton()
    }
    
    private func leftBarButton() -> UIBarButtonItem {
        if authenticationViewModel.isAuthenticated {
            return UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(showProfile(_:)))
        } else {
            let barButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(loginTap(_:)))
            return barButtonItem
        }
    }
    
    @objc func showProfile(_ sender: AnyObject) {
    }
    
    @objc func loginTap(_ sender: AnyObject) {
        authenticationViewModel.login()
    }
}
