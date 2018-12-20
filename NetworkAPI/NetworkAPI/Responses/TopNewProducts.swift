//
//  TopNewProducts.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

public class TopNewProducts: BaseResponse {
    
    public let products: [Product]
    
    private enum CodingKeys: String, CodingKey {
        case products
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.products = try container.decode([Product].self, forKey: .products)
        try super.init(from: decoder)
    }
}
