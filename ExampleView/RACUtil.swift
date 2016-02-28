//
//  RACUtil.swift
//  SwinjectMVVMExample
//
//  Created by Dustin Schie on 2/27/16.
//  Copyright © 2016 Dustin Schie. All rights reserved.
//

import UIKit
import ReactiveCocoa

internal extension UITableViewCell {
    internal var racutil_prepareForReuseProducer: SignalProducer<(), NoError> {
        return self.rac_prepareForReuseSignal
            .toSignalProducer()
            .map { _ in }
            .flatMapError { _ in SignalProducer(value: ()) }
    }
}
