//
//  CreateMerchItemViewController.swift
//  Acacia Ridge Presents the Band App
//
//  Created by Alex Shillingford on 8/10/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class CreateMerchItemViewController: UIViewController {
    
    //MARK: - IBOutlets and Properties
    @IBOutlet weak var merchItemTextField: UITextField!
    @IBOutlet weak var merchCountTextField: UITextField!
    @IBOutlet weak var merchPriceTextField: UITextField!
    
    let merchItemCount: [String] = Array(0...1000).map { String($0) }
    var selectedCount: String?
    
    //MARK: - Methods and IBActions
    override func viewDidLoad() {
        super.viewDidLoad()
        createCountPicker()
        createToolbar()
        
    }
    
    @IBAction func saveItemButtonTapped(_ sender: UIButton) {
        
    }
    
    func createCountPicker() {
        let countPicker = UIPickerView()
        countPicker.delegate = self
        
        merchCountTextField.inputView = countPicker
    }
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CreateMerchItemViewController.dismissKeyboard))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        merchCountTextField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - Extensions
extension CreateMerchItemViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return merchItemCount.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return merchItemCount[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCount = merchItemCount[row]
        merchCountTextField.text = selectedCount
    }
    
}
