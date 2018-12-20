//
//  TopFeatured.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

public class TopFeatured: BaseResponse {
    
    public let featured: [Featured]
    
    private enum CodingKeys: String, CodingKey {
        case featured
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.featured = try container.decode([Featured].self, forKey: .featured)
        try super.init(from: decoder)
    }
}
