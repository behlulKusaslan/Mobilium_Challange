//
//  Product.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

public struct Product: Decodable {
    let cargoTime: Int?
    let category: Category?
    let categoryId: Int?
    let commentCount: Int?
    let commissionRate: Int?
    let definition: String?
    let difference: String?
    let id: Int?
    let images: [Image]?
    let isActive: Bool?
    let isApproved: Bool?
    let isCargoFree: Bool?
    let isEditorChoice: Bool?
    let isLiked: Bool?
    let isNew: Bool?
    let isOwner: Bool?
    let likeCount: Int?
    let oldPrice: Int?
    let price: Int?
    let shareUrl: String?
    let shop: Shop?
    let slug: String?
    let stock: Int?
    let title: String?
    
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
    let height : Int?
    let medium : Medium?
    let thumbnail : Thumbnail?
    let url : String?
    let width : Int?
}

public struct Logo: Decodable {
    let height : Int?
    let medium : Medium?
    let thumbnail : Thumbnail?
    let url : String?
    let width : Int?
}