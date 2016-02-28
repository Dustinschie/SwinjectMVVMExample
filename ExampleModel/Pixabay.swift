//
//  Pixabay.swift
//  SwinjectMVVMExample
//
//  Created by Dustin Schie on 2/26/16.
//  Copyright © 2016 Dustin Schie. All rights reserved.
//

internal struct Pixabay {
    internal static let apiURL = "https://pixabay.com/api/"
    
    internal static var requestParameters: [String : AnyObject] {
        return [
            "key": Config.apiKey,
            "image_type": "photo",
            "safesearch": true,
            "per_page": 50,
        ]
    }
}

extension Pixabay {
    private struct Config {
        private static let apiKey = ""
    }
}