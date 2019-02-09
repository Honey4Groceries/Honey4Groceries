//
//  ViewController.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 11/12/18.
//

import UIKit
import Foundation
import PureLayout

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = CustomCell()
        tableViewCell.nameLabel?.text = data[indexPath.row]
        return tableViewCell
    }

    let data = ["CSE 12", "CSE 15L", "MATH 109", "ANTH 23"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return UIScreen.main.bounds.width * 0.01
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return UIScreen.main.bounds.height * 0.005
    }
    
    var item = ""
    var amt = 0
    private var myUIPicker: UIPickerView!
    private var myTableView = UITableView()
    
    @IBOutlet weak var picker: UIPickerView?
    
    override func viewDidLoad() {
        
        // Call the superclass viewDidLoad Method
        super.viewDidLoad()
        
        // Set the background color of the current view to white.
        self.view.backgroundColor = .white
        
        myUIPicker = UIPickerView()
        myUIPicker.frame = (self.view.bounds)
        
        myTableView = UITableView()
        myTableView.frame = (self.view.bounds)
        
        myUIPicker.delegate = self
        myUIPicker.dataSource = self
        
        //self.view.addSubview(myUIPicker)
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        myTableView.estimatedRowHeight = 40.0
        

        
        self.view.addSubview(myTableView)
    
    }
    
}
class CustomCell: UITableViewCell {
    var picker: UIPickerView!
    var nameLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initialize()
        
        
//        let viewsDict = [
  //          "image" : imgUser,
    //        "username" : labUerName,
//            "message" : labMessage,
//            "labTime" : labTime,
  //          ] as [String : Any]
        
}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    func initialize() {
        self.nameLabel = UILabel()
        self.picker = UIPickerView()
        
        
        nameLabel.backgroundColor = UIColor.white
        
        contentView.addSubview(picker)
        contentView.addSubview(nameLabel)
        nameLabel.autoCenterInSuperview()
        picker.autoPinEdge(toSuperviewEdge: .right, withInset: UIScreen.main.bounds.width * 0.1)
        picker.autoMatch(.height, to: .height, of: self.contentView, withMultiplier: 0.7)
        picker.autoMatch(.width, to: .width, of: self.contentView, withMultiplier: 0.2)
        print("picker: "+picker.frame.debugDescription)
        print("nameLabel: "+nameLabel.frame.debugDescription)
        
    }
    
}
