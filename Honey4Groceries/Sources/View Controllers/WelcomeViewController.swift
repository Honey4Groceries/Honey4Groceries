//
//  welcomeViewController.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2018/11/27.
//

import UIKit
import PureLayout
import Firebase
import Bond

/// The view controller for the login page.
class WelcomeViewController: UIViewController, ViewControllerProtocol {
    
    // ViewModel
    var viewModel: ViewModelProtocol
    
    /// Constructor to be called
    init(view: WelcomeView, viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view = view
        self.bindViewModel()
    }
    
    /// Since we are not using .nib, this should never be called.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.viewModel = WelcomeViewModel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.view = WelcomeView()
    }
    
    /// Required for all UIViewControllers
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViewModel() {
        guard let welcomeView = self.view as? WelcomeView else { return }
        guard let welcomeViewModel = self.viewModel as? WelcomeViewModel else { return }

        _ = welcomeView.loginButton.reactive.tap.observeNext {
            do {
                try _ = welcomeViewModel.login()
            } catch {
            }
        }
        
        _ = welcomeView.signupButton.reactive.tap.observeNext {
            do {
                
            }
        }
        
        _ = welcomeView.emailTextField.reactive.text.observeNext { text in
            guard let email = text else { return }
            welcomeViewModel.setUserEmail(email: email)
        }
        
        _ = welcomeView.passwordTextField.reactive.text.observeNext { text in
            guard let password = text else { return }
            welcomeViewModel.setPassword(password: password)
        }
    }
}
