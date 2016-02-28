//
//  ImageSearchTableViewModeling.swift
//  SwinjectMVVMExample
//
//  Created by Dustin Schie on 2/27/16.
//  Copyright © 2016 Dustin Schie. All rights reserved.
//

import ReactiveCocoa
public protocol ImageSearchTableViewModeling {
    var cellModels: AnyProperty<[ImageSearchTableViewCellModeling]> { get }
    func startSearch()
}
