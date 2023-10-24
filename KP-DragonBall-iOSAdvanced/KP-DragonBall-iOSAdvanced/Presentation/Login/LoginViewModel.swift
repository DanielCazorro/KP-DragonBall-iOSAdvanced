//
//  LoginViewModel.swift
//  KP-DragonBall-iOSAdvanced
//
//  Created by Daniel Cazorro Frías on 24/10/23.
//

import Foundation

class LoginViewModel: LoginViewControllerDelegate {

    // MARK: - Properties -
    var viewState: ((LoginViewState) -> Void)?
    
    // MARK: - Public functions -
    func onLoginPressed(email: String?, password: String?) {
        viewState?(.loading(true))
    }
}

