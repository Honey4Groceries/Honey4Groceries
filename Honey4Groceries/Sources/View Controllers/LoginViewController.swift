//
//  LoginViewController.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2018/11/27.
//

import UIKit
import PureLayout

/// The view controller for the login page.
class LoginViewController: UIViewController {

    /// The radius of the outer boundary corners of GUI elements.
    let boundaryRadius: CGFloat = 4.0

    /// The width of the outer boundary of GUI elements.
    let boundaryWidth: CGFloat = 1.0

    /// The color of the outer boundary of GUI elements.
    let boundaryColor = UIColor.gray.cgColor

    /// The height of the textfields.
    let textfieldHeight: CGFloat = 40.0

    /// The amount of horizontal inset for the text fields from the edges.
    let textfieldXInset: CGFloat = 20.0

    /// The amount to inset the username text field from the top safe area/edge.
    let usernameYInset: CGFloat = 75.0

    /// The amount to inset the password text field from the top safe area/edge.
    let passwordYInset: CGFloat = 150.0

    /// The amount to inset the login button from the bottom safe area/edge.
    let loginYInset: CGFloat = 20.0

    /// The width of the login button.
    let buttonWidth: CGFloat = 96.0

    /// The height of the login button.
    let buttonHeight: CGFloat = 32.0

    /// The vertical padding of the login button placeholder.
    let verticalPadding: CGFloat = 10.0

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

    /// The text field for the username.
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
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

    /// Adds the subviews to the current view.
    func addSubviews() {
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
    }

    /**
     Do some additional setup after loading the view.
     */
    override func viewDidLoad() {
        // Call the superclass' viewDidLoad method.
        super.viewDidLoad()

        // Set the background color of the current view to white.
        self.view.backgroundColor = .white

        // Adds subviews to the current view.
        self.addSubviews()

        // Sets up the constraints for the subviews.
        self.setupConstraints()
    }
}

/// An extension to the UITextField for new custom functions.
extension UITextField {

    /**
     Sets the left padding value for the UITextField.
     
     Calling this function prevents elements in the text field from touching the text field boundary.
     
     - Parameter amount: the amount to inset the elements inside the text field from the left boundary.
     */
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    /**
     Sets the right padding values for the UITextField.
     
     Calling this function prevents elements in the text field from touching the text field boundary.
     
     - Parameter amount: the amount to inset the elements inside the text field from the right boundary.
     */
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
