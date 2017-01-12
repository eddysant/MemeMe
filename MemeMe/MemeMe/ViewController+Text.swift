//
//  ViewController+Text.swift
//  MemeMe
//
//  Created by Sant, Eddy on 2017-01-10.
//  Copyright © 2017 Eddy Sant. All rights reserved.
//

import UIKit

extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 2 {
            subscribeToKeyboardNotifications()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField.tag == 1 && textField.text == "TOP") || (textField.tag == 2 && textField.text == "BOTTOM") {
            textField.text = ""
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 1 && textField.text == "" {
            textField.text = "TOP"
        } else if textField.tag == 2 && textField.text == "" {
            textField.text = "BOTTOM"
        }
        unsubscribeFromKeyboardNotifications()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
