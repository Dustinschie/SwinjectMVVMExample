//
//  Networking.swift
//  SwinjectMVVMExample
//
//  Created by Dustin Schie on 2/26/16.
//  Copyright © 2016 Dustin Schie. All rights reserved.
//

import ReactiveCocoa

public protocol Networking {
    func requestJSON(url: String, parameters: [String : AnyObject]?) -> SignalProducer<AnyObject, NetworkError>
    
    func requestImage(url: String) -> SignalProducer<UIImage, NetworkError>
}
