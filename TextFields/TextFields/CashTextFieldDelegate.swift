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
        
        //TODO: BUG - Strange bug after entring 15 characters. This is probably a memory problem related to Doubles or the CurrencyStyle of NSNumberFormatter
        
        //initalize NSNumberFormatter to help us format the string properly and set style to currency (assuming locale is in the U.S.A.)
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        // Construct the text that will be in the field if this change is accepted
        var newText = textField.text as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        //get number value of string in text field which adheres to currency style (i.e. $x.xx)
        var inputNumber = formatter.numberFromString(newText as String) as! Double
        
        //multiply number by 10 to shift decimal place over one space to the right
        inputNumber = inputNumber*10.000
        
        //use nsnumberformatter to convert our calculated number back to string
        newText = formatter.stringFromNumber(inputNumber as NSNumber)!
        
        //set textfield to our newText - return false because we are manually setting the new textField since there are formatting requirements
        textField.text = newText as String
        
        return false
    }

}
