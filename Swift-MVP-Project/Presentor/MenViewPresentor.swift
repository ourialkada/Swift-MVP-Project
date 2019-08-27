//
//  SignInPresentor.swift
//  Swift-MVP-Project
//
//  Created by Ouri -Live Care on 8/26/19.
//  Copyright © 2019 Ouri Alkada. All rights reserved.
//

import Foundation
import Firebase

protocol MenViewDelegate: NSObjectProtocol {
   
}

class MenViewPresentor {
    weak private var menViewDelegate : MenViewDelegate?
    static var MenCells:[TableList] = []
    
    func setViewDelegate(menViewDelegate:MenViewDelegate?){
        self.menViewDelegate = menViewDelegate
    }
    
    func getdoc()
    {
        utils.getDocuments(type: "Men")
    }
}
