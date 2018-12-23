//
//  CommonDTOs.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

public struct Cover: Decodable {
    public let width: Int
    public let height: Int
    private let url: URL
    public var imageUrl : URL {
        return url.regulateImageUrl()
    }
    public let medium: Medium
    public let thumbnail: Thumbnail
}

public struct Medium: Decodable {
    public let width: Int
    public let height: Int
    private let url: URL
    public var imageUrl : URL {
        return url.regulateImageUrl()
    }
}

public struct Thumbnail: Decodable {
    public let width: Int
    public let height: Int
    private let url: URL
    public var imageUrl : URL {
        return url.regulateImageUrl()
    }
}

public struct VitrinovaCategory: Decodable {
    public let id : Int
    public let name : String
    public let order : Int?
    public let parentCategory : ParentCategory?
    public let parentId : Int?
    public let logo: Logo?
    public let cover: Cover?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case order
        case parentCategory = "parent_category"
        case parentId = "parent_id"
        case logo
        case cover
    }
}

public struct ParentCategory: Decodable {
    public let id : Int?
    public let name : String?
    public let order : Int?
}
