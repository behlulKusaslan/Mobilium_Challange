//
//  TopCollections.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

public class TopCollections: BaseResponse {
    
    public let collections: [VitrinovaCollection]
    
    private enum CodingKeys: String, CodingKey {
        case collections
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.collections = try container.decode([VitrinovaCollection].self, forKey: .collections)
        try super.init(from: decoder)
    }
}
