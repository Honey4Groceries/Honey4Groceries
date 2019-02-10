//
//  ListDelegate+DS.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 2/10/19.
//

import UIKit
import Foundation

fileprivate let data = ["CSE 12", "CSE 15L", "MATH 109", "ANTH 23"]

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
    }
}
