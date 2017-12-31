//
//  TimelineViewController.swift
//  Kicauan
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class TimelineViewController: UIViewController {
    
    var authenticationViewModel: AuthenticationViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticationViewModel.authenticationSuccessEvent
            .subscribe(onNext: { [weak self] (success) in
                guard let theSelf = self else { return }
                theSelf.navigationItem.leftBarButtonItem = theSelf.leftBarButton()
        }).disposed(by: disposeBag)
        
        authenticationViewModel.showLoadingEvent
            .subscribe(onNext: { (show) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = show
        }).disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.leftBarButtonItem = leftBarButton()
    }
    
    private func leftBarButton() -> UIBarButtonItem {
        if authenticationViewModel.isAuthenticated {
            let barButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(showProfile(_:)))
            return barButtonItem
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
