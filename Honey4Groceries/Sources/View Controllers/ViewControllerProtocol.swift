//
//  ViewControllerProtocol.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 4/30/19.
//

import Foundation
import UIKit

protocol ViewControllerProtocol: UIViewController {
    /// Bind viewmodel to viewcontroller
    func bindViewModel()
    
    var viewModel: ViewModelProtocol {get set}
}
