//
//  SignupViewController.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2018/12/04.
//

//
//  SignupViewController.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2018/12/04.
//

import UIKit
import PureLayout

class SignupViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addSubviews()
        self.setupConstraints()
        
        /// Register new user label
        let registerNU = UILabel(frame: CGRect(x: 100, y: 0, width: 350, height: 30))
        registerNU.font = UIFont.boldSystemFont(ofSize: 28.0)
        registerNU.textColor = .black
        registerNU.center = CGPoint(x: 140, y: 110)
        registerNU.textAlignment = .center
        registerNU.text = "Register New User"
        self.view.addSubview(registerNU)
    }
    
     /// The radius of the outer boundary corners of GUI elements.
    lazy var boundaryRadius: CGFloat = 0.01
    
    /// The width of the outer boundary of GUI elements.
    let boundaryWidth: CGFloat = 1.0
    
    /// The color of the outer boundary of GUI elements.
    let boundaryColor = UIColor.gray.cgColor
    
    /// The height of the textfields.
    let textfieldHeight: CGFloat = 40.0
    
    /// The amount of horizontal inset for the text fields from the edges.
    let textfieldXInset: CGFloat = 20.0
    
    /// The amount to inset the username text field from the top safe area/edge.
    let usernameYInset: CGFloat = 220.0
    
    ///The amount to inset the firstname text field from the top safe area/edge
    let firstNameYInset: CGFloat = 100.0
    
    ///The amount to inset the lastname text field from the top safe area/edge
    let lastNameYInset: CGFloat = 160.0
    
    ///THe amount to inset the emailAddress text field from the top safe area/ edge
    let emailAddressYInset: CGFloat = 280.0
    
    /// The amount to inset the password text field from the top safe area/edge.
    let passwordYInset: CGFloat = 340.0
    
    //The amount to inset the confirm password text field from the top safe area/edge
    let confirmPasswordYInset: CGFloat = 400.0
    
    /// The amount to inset the sign-up button from the center vertical axis.
    let buttonXInset: CGFloat = 70.0
    
    /// The amount to inset the login button from the top safe area/edge.
    let buttonYInset: CGFloat = 460.0
    
    /// The width of the login button.
    let buttonWidth: CGFloat = 96.0
    
    /// The height of the login button.
    let buttonHeight: CGFloat = 32.0
    
    /// The vertical padding of the login button placeholder.
    let verticalPadding: CGFloat = 10.0
    
    /// The cancel button.
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = boundaryRadius
        button.layer.borderColor = boundaryColor
        button.layer.borderWidth = boundaryWidth
        button.tintColor = .gray
        button.backgroundColor = .clear
        button.autoSetDimension(.width, toSize: buttonWidth)
        button.autoSetDimension(.height, toSize: buttonHeight)
        button.addTarget(self, action: #selector(self.cancelButtonTapped), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(self.signupButtonTapped), for: .touchUpInside)
        return button
    }()
    
    /// The text field for the first name.
    lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "First Name"
        textField.setLeftPaddingPoints(verticalPadding)
        textField.setRightPaddingPoints(verticalPadding)
        textField.layer.cornerRadius = boundaryRadius
        textField.layer.borderColor = boundaryColor
        textField.layer.borderWidth = boundaryWidth
        textField.autoSetDimension(.height, toSize: textfieldHeight)
        return textField
    }()
    
    /// The text field for the last name.
    lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Last Name"
        textField.setLeftPaddingPoints(verticalPadding)
        textField.setRightPaddingPoints(verticalPadding)
        textField.layer.cornerRadius = boundaryRadius
        textField.layer.borderColor = boundaryColor
        textField.layer.borderWidth = boundaryWidth
        textField.autoSetDimension(.height, toSize: textfieldHeight)
        return textField
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
    
    /// The text field for the email address.
    lazy var emailAddressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email Address"
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
    
    /// The text field for the confirm password.
    lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm Password"
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
  
     */
    func setupConstraints() {
        cancelButton.autoAlignAxis(.vertical, toSameAxisOf: self.view, withOffset: -buttonXInset)
        signupButton.autoAlignAxis(.vertical, toSameAxisOf: self.view, withOffset: buttonXInset)
        if #available(iOS 11.0, *) {
            cancelButton.autoPinEdge(toSuperviewSafeArea: .top, withInset: buttonYInset)
            signupButton.autoPinEdge(toSuperviewSafeArea: .top, withInset: buttonYInset)
            firstNameTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: firstNameYInset)
            lastNameTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: lastNameYInset)
            usernameTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: usernameYInset)
            emailAddressTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: emailAddressYInset)
            passwordTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: passwordYInset)
            confirmPasswordTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: confirmPasswordYInset)

        } else {
            cancelButton.autoPinEdge(toSuperviewSafeArea: .top, withInset: buttonYInset)
            signupButton.autoPinEdge(toSuperviewSafeArea: .top, withInset: buttonYInset)
            firstNameTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: firstNameYInset)
            lastNameTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: lastNameYInset)
            usernameTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: usernameYInset)
            emailAddressTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: emailAddressYInset)
            passwordTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: passwordYInset)
            confirmPasswordTextField.autoPinEdge(toSuperviewSafeArea: .top, withInset: confirmPasswordYInset)     }
        
        firstNameTextField.autoPinEdge(toSuperviewEdge: .left, withInset: textfieldXInset)
        firstNameTextField.autoPinEdge(toSuperviewEdge: .right, withInset: textfieldXInset)
        passwordTextField.autoPinEdge(toSuperviewEdge: .left, withInset: textfieldXInset)
        passwordTextField.autoPinEdge(toSuperviewEdge: .right, withInset: textfieldXInset)
        lastNameTextField.autoPinEdge(toSuperviewEdge: .left, withInset: textfieldXInset)
        lastNameTextField.autoPinEdge(toSuperviewEdge: .right, withInset: textfieldXInset)
        usernameTextField.autoPinEdge(toSuperviewEdge: .left, withInset: textfieldXInset)
        usernameTextField.autoPinEdge(toSuperviewEdge: .right, withInset: textfieldXInset)
        emailAddressTextField.autoPinEdge(toSuperviewEdge: .left, withInset: textfieldXInset)
        emailAddressTextField.autoPinEdge(toSuperviewEdge: .right, withInset: textfieldXInset)
        confirmPasswordTextField.autoPinEdge(toSuperviewEdge: .left, withInset: textfieldXInset)
        confirmPasswordTextField.autoPinEdge(toSuperviewEdge: .right, withInset: textfieldXInset)

    }
    
    /// Adds the subviews to the current view.
    func addSubviews() {
        self.view.addSubview(firstNameTextField)
        self.view.addSubview(lastNameTextField)
        self.view.addSubview(emailAddressTextField)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(confirmPasswordTextField)
        self.view.addSubview(cancelButton)
        self.view.addSubview(signupButton)
    }
    
    /// Back to sign up screen when the cancel button is tapped
    @objc func cancelButtonTapped(_ sender: Any) {
        print("Cancel button tapped")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    /// Signs the user up
    @objc func signupButtonTapped(_ sender: Any) {
        print("Sign up button tapped")
        
        // Validate required fields are not empty
        if (firstNameTextField.text?.isEmpty)! ||
            (lastNameTextField.text?.isEmpty)! ||
            (usernameTextField.text?.isEmpty)! ||
            (emailAddressTextField.text?.isEmpty)! ||
            (passwordTextField.text?.isEmpty)! ||
            (confirmPasswordTextField.text?.isEmpty)!
            
        // Display Alert message and return
        {
            displayMessage(userMessage: "All fields are required to fill in")
            return
        }
        
        // Validate password
        if ((passwordTextField.text?.elementsEqual(confirmPasswordTextField.text!))! != true)
            
        // Display alert message and return
        {
            displayMessage(userMessage: "Please make sure that passwords match")
            return
        }
        
        // Create Activity Indicator
        let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        
        // Position Activity Indicator in the center of the main view
        myActivityIndicator.center = view.center
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = false
        
        // Start Activity Indicator
        myActivityIndicator.startAnimating()
        
        view.addSubview(myActivityIndicator)
        
        // Send HTTP Request to Register user
        /**
 
        I left the URL as a placeholder because I don't know which API or where the user information is stored
 
        */
        let myUrl = URL(string: "http://localhost:8080/api/users")
        var request = URLRequest(url:myUrl!)
        request.httpMethod = "POST"// Compose a query string
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let postString = ["firstName": firstNameTextField.text!,
                          "lastName": lastNameTextField.text!,
                          "email": emailAddressTextField.text!,
                          "username": usernameTextField.text!,
                          "password": passwordTextField.text!,
                          "confirmPassword": confirmPasswordTextField.text!
                          ] as [String: String]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: postString, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            displayMessage(userMessage: "Something went wrong. Try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            self.removeActivityIndicator(activityIndicator: myActivityIndicator)
            
            if error != nil {
                self.displayMessage(userMessage: "Could not successfully perform this request. Please try again later")
                print("error=\(String(describing: error))")
                return
            }
            
            //Converts response sent from a server side code to a NSDictionary object:
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                if let parseJSON = json {
                    
                    let userId = parseJSON["userId"] as? String
                    print("User id: \(String(describing: userId!))")
                    
                    if (userId?.isEmpty)! {
                        // Display an Alert dialog with a friendly error message
                        self.displayMessage(userMessage: "Could not successfully perform this request. Please try again later")
                        return
                    } else {
                        self.displayMessage(userMessage: "Successfully Registered a New Account. Please proceed to Sign in")
                    }
                    
                } else {
                    //Display an Alert dialog with a friendly error message
                    self.displayMessage(userMessage: "Could not successfully perform this request. Please try again later")
                }
            } catch {
                
                self.removeActivityIndicator(activityIndicator: myActivityIndicator)
                
                // Display an Alert dialog with a friendly error message
                self.displayMessage(userMessage: "Could not successfully perform this request. Please try again later")
                print(error)
            }
        }
        
        task.resume()
        
    }
    
    func removeActivityIndicator(activityIndicator: UIActivityIndicatorView)
    {
        DispatchQueue.main.async
            {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
        }
    }
    
    //Displays Alert message
    func displayMessage(userMessage:String) {
        DispatchQueue.main.async
            {   let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
                
                let signupViewController: SignupViewController = SignupViewController()
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    // Code in this block will trigger when OK button tapped.
                    print("Ok button tapped")
                    DispatchQueue.main.async
                        {
                            self.present(signupViewController, animated: false, completion: nil)
                    }
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion:nil)
        }
    }
    
}
