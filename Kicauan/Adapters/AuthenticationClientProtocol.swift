//
//  AuthenticationClientProtocol.swift
//  Kicauan
//
//  Created by deni zakya on 02/12/17.
//  Copyright © 2017 deni zakya. All rights reserved.
//

protocol AuthenticationClientProtocol {
    var isLoggedIn: Bool { get }
    var currentSession: TwitterSession? { get }
    
    func login(_ completion: @escaping (_ session: TwitterSession?, _ error: Error?) -> Void)
    func logout(_ session: TwitterSession)
}
