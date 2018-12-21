//
//  Featured.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

public struct Featured: Decodable {
    public let id: Int
    public let type: String
    public let cover: Cover
    public let title: String
    public let subTitle: String
    
    public enum CodingKeys: String, CodingKey {
        case id
        case type
        case cover
        case title
        case subTitle = "sub_title"
    }
    
}
