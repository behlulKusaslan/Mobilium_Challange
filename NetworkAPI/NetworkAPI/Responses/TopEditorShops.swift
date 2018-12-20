//
//  TopEditorShops.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

public class TopEditorShops: BaseResponse {
    
    public let shops: [Shop]
    
    private enum CodingKeys: String, CodingKey {
        case shops
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.shops = try container.decode([Shop].self, forKey: .shops)
        try super.init(from: decoder)
    }
}
