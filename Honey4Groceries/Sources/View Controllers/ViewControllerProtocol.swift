//
//  ViewControllerProtocol.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 4/30/19.
//

import Foundation
import UIKit

/// Protocol for ViewController acting as binder in MVVM to bind view and viewModel
protocol ViewControllerProtocol: UIViewController {
    /// Bind viewmodel to view
    func bindViewModel()
    
    var viewModel: ViewModelProtocol {get set}
}
