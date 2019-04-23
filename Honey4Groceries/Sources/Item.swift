//
//  Item.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 2/16/19.
//

import Foundation

class Item: NSObject {
    public var name: String
    public var quantity: Int
    
    override init() {
        self.name = ""
        self.quantity = 0
    }
    
    init(name: String, quantity: Int) {
        self.name = name
        self.quantity = quantity
    }
    
    public func setQuantity(quantity: Int) {
        self.quantity = quantity
    }
}
