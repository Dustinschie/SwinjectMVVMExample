//
//  ImageSearching.swift
//  SwinjectMVVMExample
//
//  Created by Dustin Schie on 2/26/16.
//  Copyright © 2016 Dustin Schie. All rights reserved.
//

import ReactiveCocoa

public protocol ImageSearching {
    func searchImages() -> SignalProducer<ResponseEntity, NetworkError>
}
