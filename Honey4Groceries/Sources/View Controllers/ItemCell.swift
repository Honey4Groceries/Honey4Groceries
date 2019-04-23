//
//  ItemCell.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 2/10/19.
//

import UIKit
import PureLayout
import Bond
import ReactiveKit

class ItemCell: UITableViewCell {
    
    lazy var picker: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var item: Item = {
        let groceryItem = Item()
        return groceryItem
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    // datasource and delegate have weak retain cycles...
    var pickerDataSource: UIPickerViewDataSource? {
        didSet {
            self.picker.dataSource = pickerDataSource
        }
    }
    
    var pickerDelegate: UIPickerViewDelegate? {
        didSet {
            self.picker.delegate = pickerDelegate
        }
    }
    
    func initialize() {
        
        self.pickerDelegate = ItemPickerDelegate()
        self.pickerDataSource = ItemPickerDataSource()
        
        contentView.addSubview(picker)
        contentView.addSubview(nameLabel)
        
        self.picker.reactive.selectedRow.observeNext { (row, component) in
            print(self.nameLabel.text)
            print(row + 1)
        }
        
        nameLabel.autoCenterInSuperview()
        picker.autoPinEdge(toSuperviewEdge: .right, withInset: UIScreen.main.bounds.width * 0.1)
        picker.autoMatch(.height, to: .height, of: self.contentView, withMultiplier: 0.7)
        picker.autoMatch(.width, to: .width, of: self.contentView, withMultiplier: 0.2)
    }

}
