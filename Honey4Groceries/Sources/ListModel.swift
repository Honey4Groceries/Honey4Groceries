//
//  ListModel.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 2/16/19.
//

import Foundation

class ListModel: NSObject {
    public var shoppingList: [Item]
    
    //addItem
    // setItemQuantity(Item, quantity)
    override public init() {
        let item = Item(name: "name", quantity: 1)
        self.shoppingList = []
        self.shoppingList.append(item)
    }
}
