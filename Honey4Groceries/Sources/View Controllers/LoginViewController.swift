//
//  LoginViewController.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2018/11/27.
//

import UIKit
import PureLayout

class LoginViewController: UIViewController {
    
    let boundaryRadius: CGFloat = 4.0
    let boundaryWidth: CGFloat = 1.0
    let boundaryColor = UIColor.gray.cgColor
    
    let textfieldHeight: CGFloat = 40.0
    let textfieldXInset: CGFloat = 20.0
    
    let usernameYInset: CGFloat = 75.0
    let passwordYInset: CGFloat = 150.0
    let loginYInset: CGFloat = 20.0
    
    let buttonWidth: CGFloat = 96.0
    let buttonHeight: CGFloat = 32.0
    
    let leftPadding: CGFloat = 10.0

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = boundaryRadius
        button.layer.borderColor = boundaryColor
        button.layer.borderWidth = boundaryWidth
        button.tintColor = .gray
        button.backgroundColor = .clear
        button.autoSetDimension(.width, toSize: buttonWidth)
        button.autoSetDimension(.height, toSize: buttonHeight)
        return button
    }()
    
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.setLeftPaddingPoints(leftPadding)
        textField.layer.cornerRadius = boundaryRadius
        textField.layer.borderColor = boundaryColor
        textField.layer.borderWidth = boundaryWidth
        textField.autoSetDimension(.height, toSize: textfieldHeight)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.setLeftPaddingPoints(leftPadding)
        textField.layer.cornerRadius = boundaryRadius
        textField.layer.borderColor = boundaryColor
        textField.layer.borderWidth = boundaryWidth
        textField.autoSetDimension(.height, toSize: textfieldHeight)
        return textField
    }()
    
    func setupConstraints() {
        loginButton.autoAlignAxis(toSuperviewAxis: .vertical)
        if #available(iOS 11.0, *) {
            loginButton.autoPinEdge(toSuperviewSafeArea: .bottom, withInset: loginYInset)
            usernameTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: usernameYInset)
            passwordTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: passwordYInset)
        } else {
            loginButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: loginYInset)
            usernameTextField.autoPinEdge(toSuperviewEdge: .top, withInset: usernameYInset)
            passwordTextField.autoPinEdge(toSuperviewEdge: .top, withInset: passwordYInset)
        }
        usernameTextField.autoPinEdge(toSuperviewEdge: .left, withInset: textfieldXInset)
        usernameTextField.autoPinEdge(toSuperviewEdge: .right, withInset: textfieldXInset)
        passwordTextField.autoPinEdge(toSuperviewEdge: .left, withInset: textfieldXInset)
        passwordTextField.autoPinEdge(toSuperviewEdge: .right, withInset: textfieldXInset)
    }
    
    func addSubviews() {
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        self.addSubviews()
        self.setupConstraints()
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
