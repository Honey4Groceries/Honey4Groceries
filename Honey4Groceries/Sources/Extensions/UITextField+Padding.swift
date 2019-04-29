//
//  UITextField+Padding.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 4/28/19.
//

import Foundation
import UIKit

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
