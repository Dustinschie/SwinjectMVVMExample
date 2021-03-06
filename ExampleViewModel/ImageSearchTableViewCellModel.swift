//
//  ImageSearchTableViewCellModel.swift
//  SwinjectMVVMExample
//
//  Created by Dustin Schie on 2/27/16.
//  Copyright © 2016 Dustin Schie. All rights reserved.
//

import ReactiveCocoa
import ExampleModel

public final class ImageSearchTableViewCellModel
    : NSObject, ImageSearchTableViewCellModeling
{
    public let id: UInt64
    public let pageImageSizeText: String
    public let tagText: String
    
    private let network: Networking
    private let previewURL: String
    private var previewImage: UIImage?
    
    internal init(image: ImageEntity, network: Networking) {
        id = image.id
        pageImageSizeText = "\(image.pageImageWidth) x \(image.pageImageHeight)"
        tagText = image.tags.joinWithSeparator(", ")
        
        self.network = network
        previewURL = image.previewURL
        
        super.init()
    }
    
    public func getPreviewImage() -> SignalProducer<UIImage?, NoError> {
        if let previewImage = self.previewImage {
            return SignalProducer(value: previewImage)
                .observeOn(UIScheduler())
        }
        else {
            let imageProducer = network.requestImage(previewURL)
                .takeUntil(self.racutil_willDeallocProducer)
                .on(next: {self.previewImage = $0 })
                .map { $0 as UIImage? }
                .flatMapError { _ in SignalProducer<UIImage?, NoError>(value: nil) }
            
            return SignalProducer(value: nil)
                .concat(imageProducer)
                .observeOn(UIScheduler())

        }
    }
}
