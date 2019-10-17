//
//  AddEditShowViewController.swift
//  Acacia Ridge Presents the Band App
//
//  Created by Alex Shillingford on 10/17/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class AddEditShowViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var venueNameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var setLengthTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var ticketCountTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        createToolbar()
    }
    
    // MARK: - IBActions
    @IBAction func save(_ sender: UIButton) {
        
    }
    
    
    
    
    // MARK: - Methods & Functions
    // Function creates a "Done" button above the keyboard to dismiss when user is done with putting something in each textField
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(CreateMerchItemViewController.dismissKeyboard))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        venueNameTextField.inputAccessoryView = toolbar
        dateTextField.inputAccessoryView = toolbar
        setLengthTextField.inputAccessoryView = toolbar
        contactTextField.inputAccessoryView = toolbar
        ticketCountTextField.inputAccessoryView = toolbar
    }

}
