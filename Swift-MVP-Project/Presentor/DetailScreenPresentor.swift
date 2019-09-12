//
//  SignInPresentor.swift
//  Swift-MVP-Project
//
//  Created by Ouri -Live Care on 8/26/19.
//  Copyright © 2019 Ouri Alkada. All rights reserved.
//

import Foundation
import Firebase

protocol DetailScreenViewDelegate: NSObjectProtocol {
    func setData(product: detailedProduct)
    func errorMessage(message:String)
}

class DetailScreenPresentor {
    weak private var detailScreenDelegate : DetailScreenViewDelegate?
    static var page = ""
    
    func setViewDelegate(detailScreenDelegate:DetailScreenViewDelegate?){
        self.detailScreenDelegate = detailScreenDelegate
    }
    
    func getDocument(detailScreenDelegate:DetailScreenViewDelegate?) {
        
        var type = ""
        var id = ""
        if  DetailScreenPresentor.page == "Men"
        {
            type = MenViewController.type
            id = MenViewController.ID
        }
        else if DetailScreenPresentor.page == "Women"
        {
            type = WomenViewController.type
            id = WomenViewController.ID
        }
        else
        {
            type = KidsViewController.type
            id = KidsViewController.ID
        }
        utils.getSpecificDocument(type: type, id: id,del: detailScreenDelegate!)
    }
    
    
    func sendToData(product:detailedProduct,del: DetailScreenViewDelegate)
    {
      
        del.setData(product: product)
    }
    
    func errorGettingData(error:String,del: DetailScreenViewDelegate)
    {
        del.errorMessage(message: error)
    }
}
