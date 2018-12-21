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
    public let url: URL
}

public struct Thumbnail: Decodable {
    public let width: Int
    public let height: Int
    public let url: URL
}

public struct Category: Decodable {
    let id : Int
    let name : String
    let order : Int?
    let parentCategory : ParentCategory?
    let parentId : Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case order
        case parentCategory = "parent_category"
        case parentId = "parent_id"
    }
}

public struct ParentCategory: Decodable {
    let id : Int?
    let name : String?
    let order : Int?
}
