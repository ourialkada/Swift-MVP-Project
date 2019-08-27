//
//  utils.swift
//  Swift-MVP-Project
//
//  Created by Ouri -Live Care on 8/26/19.
//  Copyright © 2019 Ouri Alkada. All rights reserved.
//

import Foundation
import Alamofire
import Firebase
import SwiftyJSON


class utils {
    
    
    static func getDocuments(type:String)
    {
        
        let currentUser = Auth.auth().currentUser
        currentUser?.getIDTokenForcingRefresh(true) { idToken, error in
            if let error = error {
                // Handle error
                return;
            }
            
            var  stringURL = "https://ouri-node-test.herokuapp.com/getCollection?type=" + type
            let url = URL(string: stringURL)
            var request = URLRequest(url: url!)
            request.httpMethod = HTTPMethod.get.rawValue
            
            Alamofire.request(request)
                .responseJSON { response in

                    let arr = response.result.value as! Array<Any>
                    
                    for element in arr as! [Dictionary<String, Any>]
                    {
                        do
                        {
                            let url = NSURL(string: element["image"] as! String);
                            var err: NSError?
                            let imageData :NSData =  try NSData(contentsOf: url! as URL,options: NSData.ReadingOptions.mappedIfSafe)
                            
                            var bgImage = UIImage(data:imageData as Data)
                            switch (type)
                            {
                            case "Men":
                                MenViewPresentor.MenCells.append(TableList(image: bgImage!, title: element["name"] as! String, description: element["description"] as! String, id: element["ID"] as! String, type: "Men"))
                                break;
                            case "Women":
                                WomenViewPresentor.WomenCells.append(TableList(image: bgImage!, title: element["name"] as! String, description: element["description"] as! String, id: element["ID"] as! String, type: "Women"))
                                break;
                            case "Kids":
                                KidsViewPresentor.kidsCells.append(TableList(image: bgImage!, title: element["name"] as! String, description: element["description"] as! String, id: element["ID"] as! String, type: "Kids"))
                                break;
                                
                            default:
                                print("Default")
                            }
                        }
                        catch
                        {
                            
                        }
                    }
            }
            
        }
    }
    
    
    
    static func getSpecificDocument(type:String,id:String,del: DetailScreenViewDelegate)
    {
        
        let currentUser = Auth.auth().currentUser
        currentUser?.getIDTokenForcingRefresh(true) { idToken, error in
            if let error = error {
                // Handle error
                return;
            }
            
            var  stringURL = "https://ouri-node-test.herokuapp.com/getDocument?type=" + type + "&id=" + id
            let url = URL(string: stringURL)
            var request = URLRequest(url: url!)
            request.httpMethod = HTTPMethod.get.rawValue
            
            Alamofire.request(request)
                .responseJSON { response in

                    if let JSON = response.result.value {
                        let json = JSON as! [String: Any]
                        do {
                            let url = NSURL(string: json["image"] as! String);
                            var err: NSError?
                            let imageData :NSData =  try NSData(contentsOf: url! as URL,options: NSData.ReadingOptions.mappedIfSafe)
                            var bgImage = UIImage(data:imageData as Data)
                            let d = DetailScreenPresentor()
                            d.sendToData(product: detailedProduct(name: json["name"] as! String, quantity: json["quantity"] as! Int, description: json["description"] as! String, price:  json["price"] as! Int, image: bgImage!),del: del)

                        }
                        catch
                        {
                            
                        }
                        
                    }
            }
        }
    }
}


