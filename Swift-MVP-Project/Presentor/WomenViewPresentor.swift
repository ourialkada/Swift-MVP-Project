//
//  SignInPresentor.swift
//  Swift-MVP-Project
//
//  Created by Ouri -Live Care on 8/26/19.
//  Copyright © 2019 Ouri Alkada. All rights reserved.
//

import Foundation
import Firebase

protocol WomenViewDelegate: NSObjectProtocol {
    
}

class WomenViewPresentor {
    weak private var womenViewDelegate : WomenViewDelegate?
    static var WomenCells:[TableList] = []
    
    func setViewDelegate(womenViewDelegate:WomenViewDelegate?){
        self.womenViewDelegate = womenViewDelegate
    }
    
    func getdoc()
    {
        utils.getDocuments(type: "Women")
    }
}
