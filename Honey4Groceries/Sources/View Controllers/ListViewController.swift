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
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.autoSetDimension(.width, toSize: 60)
        button.autoSetDimension(.height, toSize: 30)
        button.addTarget(self, action: #selector(self.getValues), for: .touchUpInside)
        return button
    }()
    
    // var listModel: ListModel

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
    
    @objc func getValues(sender: UIButton) {
    }

    
    override func viewDidLoad() {
        // Call the superclass viewDidLoad Method
        super.viewDidLoad()
        
        //self.listModel = ListModel()
        
        self.listTableViewDataSource = ListTableViewDataSource()
        self.listTableViewDelegate = ListTableViewDelegate()
        
        listTableView.tableFooterView = submitButton
        view.addSubview(listTableView)
    }
    
}
