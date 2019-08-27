//
//  Extensions.swift
//  Swift-MVP-Project
//
//  Created by Ouri -Live Care on 8/26/19.
//  Copyright © 2019 Ouri Alkada. All rights reserved.
//

import Foundation
import UIKit
class Extensions: UIViewController {
    
    
}

extension UITextField{
    
    @IBInspectable var doneAccessor: Bool{
        get{
            return self.doneAccessor
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        
        self.resignFirstResponder()
        
    }
}
