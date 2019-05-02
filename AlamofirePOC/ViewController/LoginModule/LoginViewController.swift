//
//  ViewController.swift
//  AlamofirePOC
//
//  Created by Ernesto Gonzalez on 5/1/19.
//  Copyright © 2019 Ernesto Gonzalez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var viewModel: LoginViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel(clientServices: ClientServices.shared)
        viewModel.autenticateUser("Test", "Test12345") { userLogged, errorMessage in
            guard userLogged else {
                // Error handling here
                return
            }
            
            // Go to the next view for example
        }
    }
}

