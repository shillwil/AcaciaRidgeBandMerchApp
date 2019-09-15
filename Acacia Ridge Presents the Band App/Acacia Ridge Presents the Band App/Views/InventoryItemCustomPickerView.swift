//
//  InventoryItemCustomPickerView.swift
//  Acacia Ridge Presents the Band App
//
//  Created by Alex Shillingford on 8/10/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class InventoryItemCustomPickerView: UIPickerView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    lazy var pickerData: [String] = {
        let pickerCount: [String] = Array(0...60).map { String($0) }
        let data: [String] = pickerCount
        return data
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dataSource = self
        delegate = self
        
        // Set default duration to 1 min 30 sec.
        selectRow(1, inComponent: 0, animated: false)
    }

}

extension InventoryItemCustomPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        <#code#>
    }
}

extension InventoryItemCustomPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
}
