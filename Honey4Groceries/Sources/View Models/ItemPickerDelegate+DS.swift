//
//  ItemPickerDelegate+DS.swift
//  Honey4Groceries
//
//  Created by Godwin Pang on 2/10/19.
//

import UIKit
import Foundation

//TODO make this an array of stuff that represents quantities
fileprivate let quantitySelection = [1,2,3,4]

class ItemPickerDelegate: NSObject, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return quantitySelection[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(quantitySelection[row])
        print(pickerView.selectedRow(inComponent: component))
    }
}

class ItemPickerDataSource: NSObject, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return quantitySelection.count
    }
}
