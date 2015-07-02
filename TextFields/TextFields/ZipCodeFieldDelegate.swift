//
//  ZipCodeFieldDelegate.swift
//  TextFields
//
//  Created by John Ceniza on 7/1/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeFieldDelegate : NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var newText = textField.text as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        if newText.length >= 6 {
            return false
        } else {
            return true
        }
    }
}
