//
//  CashTextFieldDelegate.swift
//  TextFields
//
//  Created by John Ceniza on 7/1/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // Construct the text that will be in the field if this change is accepted
        var newText = textField.text as NSString
        newText = newText.stringByReplacingOccurrencesOfString(".", withString: "")
        newText = newText.stringByReplacingOccurrencesOfString("$", withString: "")
        
        var characters = Array(String(newText))
        
        characters.insert(".", atIndex: characters.count-2)
        characters.insert("$", atIndex: 0)
        
        println("\(characters)")
        
        return true
    }
}