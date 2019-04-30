//
//  File.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 4/30/19.
//

import Foundation
import UIKit

protocol ViewProtocol: UIView {
    /// List of childViews (subviews is keyword)
    var childViews: [UIView] { get }
    
    var screenWidth: CGFloat { get set }
    var screenHeight: CGFloat { get set }
    
    /// Must be called in constructor
    func initialize()
    
    /// Add all child views into self.childViews in the order of background to foreground
    func addChildViews()
    
    /// Add all child views in self.childViews as subviews
    func addSubviews()
    
    /// Setup autolayout contraints for subviews
    func setupConstraints()
}

extension ViewProtocol {
    func addSubviews() {
        for view in self.childViews {
            self.addSubview(view)
        }
    }
    
    func initialize() {
        addChildViews()
        addSubviews()
        setupConstraints()
    }
}
