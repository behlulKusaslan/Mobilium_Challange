//
//  Collection.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

public struct VitrinovaCollection: Decodable {
    public let cover : Cover
    public let definition : String
    public let id : Int?
    public let logo : Logo?
    public let shareUrl : String?
    public let start : String?
    public let title : String
    
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
