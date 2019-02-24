//
//  ItemPicker.swift
//  Honey4Groceries
//
//  Created by Paul Pan on 2019/02/23.
//

import UIKit

class ItemPicker: UIPickerView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    let item: Item?
    
    public init(item: Item) {
        self.item = item
        super.init(frame: CGRect.init())
    }
    public override init(frame: CGRect) {
        self.item = nil
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.item = nil
        super.init(coder: aDecoder)
    }

}
