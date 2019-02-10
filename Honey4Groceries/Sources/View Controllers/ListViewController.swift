//
//  ViewController.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit
import Foundation

class ListViewController: UIViewController {
    
    lazy var listTableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        return tableView
        // TODO set whatever you need here for the tableview
    }()

    var listTableViewDelegate: UITableViewDelegate? {
        didSet {
            self.listTableView.delegate = listTableViewDelegate
        }
    }
    
    var listTableViewDataSource: UITableViewDataSource? {
        didSet {
            self.listTableView.dataSource = listTableViewDataSource
            self.listTableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        // Call the superclass viewDidLoad Method
        super.viewDidLoad()
        
        self.listTableViewDataSource = ListTableViewDataSource()
        self.listTableViewDelegate = ListTableViewDelegate()
        
        view.addSubview(listTableView)
    }
    
}
