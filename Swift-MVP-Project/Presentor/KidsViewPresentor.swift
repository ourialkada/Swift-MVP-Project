//
//  SignInPresentor.swift
//  Swift-MVP-Project
//
//  Created by Ouri -Live Care on 8/26/19.
//  Copyright © 2019 Ouri Alkada. All rights reserved.
//

import Foundation
import Firebase

protocol KidsViewDelegate: NSObjectProtocol {
    
}

class KidsViewPresentor {
    weak private var kidsViewDelegate : KidsViewDelegate?
    static var kidsCells:[TableList] = []
    
    func setViewDelegate(kidsViewDelegate:KidsViewDelegate?){
        self.kidsViewDelegate = kidsViewDelegate
    }
    
    func getdoc()
    {
        utils.getDocuments(type: "Kids")
    }
}
