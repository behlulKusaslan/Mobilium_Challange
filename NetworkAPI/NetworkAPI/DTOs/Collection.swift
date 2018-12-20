//
//  Collection.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

public struct Collection: Decodable {
    let cover : Cover?
    let definition : String?
    let id : Int?
    let logo : Logo?
    let shareUrl : String?
    let start : String?
    let title : String?
    
    enum CodingKeys: String, CodingKey {
        case cover
        case definition
        case id
        case logo
        case shareUrl = "share_url"
        case start
        case title
    }
}
