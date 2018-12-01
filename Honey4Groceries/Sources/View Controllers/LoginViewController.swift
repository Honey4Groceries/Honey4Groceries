//
//  LoginViewController.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2018/11/27.
//

import UIKit
import PureLayout

class LoginViewController: UIViewController {
    
    let screenWidth = Double(ALDimension.width)
    let screenHeight = Double(ALDimension.height)
    
    lazy var textWidth = screenWidth * 0.8
    lazy var textHeight = screenHeight * 0.1
    
    lazy var middleX = screenWidth / 2
    lazy var middleY = screenHeight / 2
    
    lazy var textXPos = screenWidth * 0.1
    lazy var loginTextYPos = screenHeight * 0.2
    lazy var passwordTextYPos = screenHeight * 0.4
    
    var loginTextField: UITextField!
    var passwordTextField: UITextField!
    
    var loginName: String?
    var loginPassword: String?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loginTextField = UITextField( frame: CGRect(x: textXPos, y: loginTextYPos, width: textWidth, height: textHeight))
        passwordTextField = UITextField( frame: CGRect(x: textXPos, y: passwordTextYPos, width: textWidth, height: textHeight))
        let loginButton = UIButton(frame: CGRect(x: 100, y: 500, width: 100, height: 50))
        loginButton.backgroundColor = UIColor.blue
        
        loginTextField.placeholder = "Login"
        passwordTextField.placeholder = "Password"
        loginButton.setTitle("Login", for: UIControl.State.normal)
        
        loginTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        
        loginButton.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)

        self.view.addSubview(loginTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func buttonAction(sender: UIButton!) {
        print("Pressed")
        loginName = loginTextField.text
        loginPassword = passwordTextField.text
        print(screenWidth)
        print(screenHeight)
    }
}
