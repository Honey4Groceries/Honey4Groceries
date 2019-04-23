//
//  ListDelegate+DS.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 2/10/19.
//

import UIKit
import Foundation

fileprivate let data = ["CSE 12", "CSE 15L", "MATH 109", "ANTH 23"]
fileprivate let items = [Item(name: "CSE 12", quantity: 0),
                         Item(name: "CSE 15L", quantity: 0),
                         Item(name: "MATH 109", quantity: 0),
                         Item(name: "ANTH 23", quantity: 0)]
let listModel = ListModel()

class ListTableViewDelegate: NSObject, UITableViewDelegate {
    
}

class ListTableViewDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = ItemCell()
        itemCell.nameLabel.text = data[indexPath.row]
        return itemCell
        // Item cell: instance var - item
        
    }
}
