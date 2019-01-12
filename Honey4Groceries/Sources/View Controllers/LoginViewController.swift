//
//  LoginViewController.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2018/11/27.
//

import UIKit
import PureLayout
import Firebase

/// The view controller for the login page.
class LoginViewController: UIViewController {

    var handle: AuthStateDidChangeListenerHandle?

    /// The dimensions of the screen
    let screenSize: CGRect = UIScreen.main.bounds

    /// The width of the screen
    lazy var screenWidth = screenSize.width

    /// The height of the screen.
    lazy var screenHeight = screenSize.height

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
        button.addTarget(self, action: #selector(self.loginAction), for: .touchUpInside)
        return button
    }()

    /// The login button.
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
        button.addTarget(self, action: #selector(self.signupAction), for: .touchUpInside)
        return button
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

    /// Adds the subviews to the current view.
    func addSubviews() {
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        self.view.addSubview(signupButton)
    }

    /// Login the user after the button is pressed.
    @objc func loginAction(sender: UIButton) {
        if let email = self.emailTextField.text, let password = self.passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                print("$$$"+(user?.description ?? "nil"))
                print(error)
            }
        }
    }

    /// Sign-up the user if the user has not already done so.
    @objc func signupAction(sender: UIButton) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.handle? = Auth.auth().addStateDidChangeListener { (auth, user) in
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(self.handle!)
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
