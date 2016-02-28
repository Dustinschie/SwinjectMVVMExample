//
//  ResponseEntity.swift
//  SwinjectMVVMExample
//
//  Created by Dustin Schie on 2/26/16.
//  Copyright © 2016 Dustin Schie. All rights reserved.
//

import Himotoki

public struct ResponseEntity {
    public let totalCount: Int64
    public let images: [ImageEntity]
}

extension ResponseEntity: Decodable {
    public static func decode(e: Extractor) throws -> ResponseEntity {
        return try ResponseEntity(
            totalCount:  e <| "totalHits",
            images: e <|| "hits"
        )
    }
}
