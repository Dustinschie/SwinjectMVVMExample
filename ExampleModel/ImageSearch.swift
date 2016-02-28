//
//  ImageSearch.swift
//  SwinjectMVVMExample
//
//  Created by Dustin Schie on 2/27/16.
//  Copyright © 2016 Dustin Schie. All rights reserved.
//

import ReactiveCocoa
import Result
import Himotoki

public final class ImageSearch: ImageSearching {
    private let network: Networking
    
    public init(network: Networking){
        self.network = network
    }
    
    public func searchImages() -> SignalProducer<ResponseEntity, NetworkError> {
        let url = Pixabay.apiURL
        let parameters = Pixabay.requestParameters
        return network.requestJSON(url, parameters: parameters)
            .attemptMap { json in
                if let response = (try? decode(json)) as ResponseEntity? {
                    return Result(value: response)
                }
                else {
                    return Result(error: .IncorrectDataReturned)
                }
        }
    }
}
