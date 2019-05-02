//
//  LoginViewModel.swift
//  AlamofirePOC
//
//  Created by Ernesto Gonzalez on 5/1/19.
//  Copyright © 2019 Ernesto Gonzalez. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    var clientServices: ClientServices
    
    init(clientServices: ClientServices) {
        self.clientServices = clientServices
    }
    
    func autenticateUser(_ email: String, _ password: String, completion: @escaping (Bool, String?) -> Void) {
        let routerConfiguration = UserRouter.login(email: email, password: password)
        clientServices.authenticateUser(configuration: routerConfiguration) { [weak self] result, error in
            guard let _ = self, let result = result, let userSession = result["data"] else {
                completion(false, error.debugDescription)
                return
            }
            
            debugPrint(userSession.userInfo.email)
            completion(true, nil)
        }
    }
}
