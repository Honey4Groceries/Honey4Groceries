//
//  ViewProtocol.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 4/30/19.
//

import Foundation
import UIKit

/// Protocol for View in MVVM
protocol ViewProtocol: UIView {
    
    var screenWidth: CGFloat { get set }
    var screenHeight: CGFloat { get set }
    
    /// Must be called in constructor to initialize subviews.
    /// Delegates to addSubviews and setupConstraints to add and setup autolayout for subviews.
    func initialize()
    
    /// Add subviews to self in order of back to front.
    func addSubviews()
    
    /// Setup autolayout contraints for subviews.
    func setupConstraints()
}

extension ViewProtocol {
    
    func initialize() {
        addSubviews()
        setupConstraints()
    }
}
