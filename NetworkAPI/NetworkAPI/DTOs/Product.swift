//
//  Product.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

public struct Product: Decodable {
    public let cargoTime: Int?
    public let category: VitrinovaCategory?
    public let categoryId: Int?
    public let commentCount: Int?
    public let commissionRate: Int?
    public let definition: String?
    public let difference: String?
    public let id: Int?
    public let images: [Image]
    public let isActive: Bool?
    public let isApproved: Bool?
    public let isCargoFree: Bool?
    public let isEditorChoice: Bool?
    public let isLiked: Bool?
    public let isNew: Bool?
    public let isOwner: Bool?
    public let likeCount: Int?
    public let oldPrice: Int?
    private let price: Int
    public var priceString: String {
        return price.priceFormatter()
    }
    public let shareUrl: String?
    public let shop: Shop
    public let slug: String?
    public let stock: Int?
    public let title: String
    
    enum CodingKeys: String, CodingKey {
        case cargoTime = "cargo_time"
        case category
        case categoryId = "category_id"
        case commentCount = "comment_count"
        case commissionRate = "commission_rate"
        case definition
        case difference
        case id
        case images
        case isActive = "is_active"
        case isApproved = "is_approved"
        case isCargoFree = "is_cargo_free"
        case isEditorChoice = "is_editor_choice"
        case isLiked = "is_liked"
        case isNew = "is_new"
        case isOwner = "is_owner"
        case likeCount = "like_count"
        case oldPrice = "old_price"
        case price
        case shareUrl = "share_url"
        case shop
        case slug
        case stock
        case title
    }
}

public struct Image: Decodable {
    public let height : Int?
    public let medium : Medium?
    public let thumbnail : Thumbnail?
    private let url: URL
    public var imageUrl : URL {
        return url.regulateImageUrl()
    }
    public let width : Int?
}

public struct Logo: Decodable {
    public let height : Int?
    public let medium : Medium
    public let thumbnail : Thumbnail?
    public let url : String?
    public let width : Int?
}
