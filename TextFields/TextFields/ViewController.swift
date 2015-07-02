//
//  ViewController.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var switcher: UISwitch!
    
    // Text Field Delegate objects
    let zipCodeDelegate = ZipCodeFieldDelegate()
    let cashFieldDelegate = CashTextFieldDelegate()
    
    // Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switcher.on = true
        self.textField3.enabled = true
        
        // Set the three delegates
        self.textField1.delegate = zipCodeDelegate
        self.textField2.delegate = cashFieldDelegate
        self.textField3.delegate = self //JC Notes: Using self as delegate because this specific text field requires a UILabel in the same view to be updated based on changes in this textfield!
    }

    
    @IBAction func textFieldSwitch(sender: UISwitch) {
        if sender.on {
            self.textField3.enabled = true
        } else {
            self.textField3.enabled = false
            self.textField3.resignFirstResponder()
        }
    }
    
    // Text Field Delegate Methods
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // Figure out what the new text will be, if we return true
        var newText: NSString = textField.text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        // returning true gives the text field permission to change its text
        return true;
    }
}

