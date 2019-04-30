//
//  UserView.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2019/04/25.
//

import Foundation
import UIKit

public class WelcomeView: UIView, ViewProtocol {
    
    var screenWidth: CGFloat
    var screenHeight: CGFloat
    
    /// The radius of the outer boundary corners of GUI elements.
    lazy var boundaryRadius: CGFloat = screenWidth * 0.01
    
    /// The width of the outer boundary of GUI elements.
    let boundaryWidth: CGFloat = 1.0
    
    /// The color of the outer boundary of GUI elements.
    let boundaryColor = UIColor.gray.cgColor
    
    /// The height of the textfields.
    lazy var textfieldHeight: CGFloat = screenHeight * 0.05
    
    /// The amount of horizontal inset for the text fields from the edges.
    lazy var textfieldXInset: CGFloat = screenWidth * 0.05
    
    /// The amount to inset the email text field from the top safe area/edge.
    lazy var emailYInset: CGFloat = screenHeight * 0.125
    
    /// The amount to inset the password text field from the top safe area/edge.
    lazy var passwordYInset: CGFloat = screenHeight * 0.225
    
    /// The amount to inset the sign-up button from the center vertical axis.
    lazy var buttonXInset: CGFloat = screenWidth * 0.10
    
    /// The amount to inset the login button from the top safe area/edge.
    lazy var buttonYInset: CGFloat = screenHeight * 0.33
    
    /// The width of the login button.
    lazy var buttonWidth: CGFloat = screenWidth * 0.3
    
    /// The height of the login button.
    lazy var buttonHeight: CGFloat = screenHeight * 0.045
    
    /// The vertical padding of the login button placeholder.
    lazy var verticalPadding: CGFloat = screenWidth * 0.03
    
    /// The login button.
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
    
    /// The signup button.
    lazy var signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
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
    
    /// Login label
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Login"
        label.autoSetDimension(.width, toSize: 200)
        label.autoSetDimension(.height, toSize: 70)
        return label
    }()
    
    /// The text field for the email.
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.setLeftPaddingPoints(verticalPadding)
        textField.setRightPaddingPoints(verticalPadding)
        textField.layer.cornerRadius = boundaryRadius
        textField.layer.borderColor = boundaryColor
        textField.layer.borderWidth = boundaryWidth
        textField.autoSetDimension(.height, toSize: textfieldHeight)
        return textField
    }()
    
    /// The text field for the password.
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.setLeftPaddingPoints(verticalPadding)
        textField.setRightPaddingPoints(verticalPadding)
        textField.layer.cornerRadius = boundaryRadius
        textField.layer.borderColor = boundaryColor
        textField.layer.borderWidth = boundaryWidth
        textField.autoSetDimension(.height, toSize: textfieldHeight)
        return textField
    }()
    
    /**
     Set the constraints of the UI elements.
     
     Calling this function on iOS 11.0 operating system results in the UI elements constrained by
     the top and bottom safe areas of the superview. For operating systems older than iOS 11.0,
     the UI elements are constrained by the top and bottom edges of the superview.
     */
    func setupConstraints() {
        loginLabel.autoPinEdge(toSuperviewEdge: .top, withInset: screenHeight * 0.182)
        loginLabel.autoAlignAxis(toSuperviewMarginAxis: .vertical)
        
        loginButton.autoPinEdge(toSuperviewEdge: .left, withInset: buttonXInset)
        signupButton.autoPinEdge(toSuperviewEdge: .right, withInset: buttonXInset)
        if #available(iOS 11.0, *) {
            loginButton.autoPinEdge(toSuperviewSafeArea: .top, withInset: buttonYInset)
            signupButton.autoPinEdge(toSuperviewSafeArea: .top, withInset: buttonYInset)
            emailTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: emailYInset)
            passwordTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: passwordYInset)
        } else {
            loginButton.autoPinEdge(toSuperviewEdge: .top, withInset: buttonYInset)
            signupButton.autoPinEdge(toSuperviewSafeArea: .top, withInset: buttonYInset)
            emailTextField.autoPinEdge(toSuperviewEdge: .top, withInset: emailYInset)
            passwordTextField.autoPinEdge(toSuperviewEdge: .top, withInset: passwordYInset)
        }
        emailTextField.autoPinEdge(toSuperviewEdge: .left, withInset: textfieldXInset)
        emailTextField.autoPinEdge(toSuperviewEdge: .right, withInset: textfieldXInset)
        passwordTextField.autoPinEdge(toSuperviewEdge: .left, withInset: textfieldXInset)
        passwordTextField.autoPinEdge(toSuperviewEdge: .right, withInset: textfieldXInset)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        self.screenWidth = frame.width
        self.screenHeight = frame.height

        super.init(frame: frame)

        self.initialize()
        
        // Do any additional setup outside of the subviews here
        self.backgroundColor = .white
    }
    
    func addSubviews() {
        self.addSubview(loginButton)
        self.addSubview(loginLabel)
        self.addSubview(signupButton)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
    }
}
