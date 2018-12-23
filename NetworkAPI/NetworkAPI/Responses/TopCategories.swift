//
//  TopCategories.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

public class TopCategories: BaseResponse {
    
    public let categories: [ShopCategory]
    
    private enum CodingKeys: String, CodingKey {
        case categories
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.categories = try container.decode([ShopCategory].self, forKey: .categories)
        try super.init(from: decoder)
    }
}
