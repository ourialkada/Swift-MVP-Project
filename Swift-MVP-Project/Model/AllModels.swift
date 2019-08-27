//
//  SignInModel.swift
//  Swift-MVP-Project
//
//  Created by Ouri -Live Care on 8/26/19.
//  Copyright © 2019 Ouri Alkada. All rights reserved.
//

import Foundation
import Alamofire

struct Credentials {
    let email: String
    let password: String
}

struct detailedProduct {
    let name: String
    let quantity: Int
    let description: String
    let price: Int
    let image: UIImage
}

struct NetworkState {
    
    var isConnected: Bool {
        return NetworkReachabilityManager(host: "www.apple.com")!.isReachable
    }
}
