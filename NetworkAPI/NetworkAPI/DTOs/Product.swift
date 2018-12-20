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

public struct Shop: Decodable {
    let commentCount : Int?
    let cover : Cover?
    let createdAt : String?
    let definition : String?
    let followerCount : Int?
    let id : Int?
    let isEditorChoice : Bool?
    let isFollowing : Bool?
    let logo : Logo?
    let name : String?
    let nameUpdateable : Bool?
    let productCount : Int?
    let shareUrl : String?
    let shopPaymentId : Int?
    let shopRate : Int?
    let slug : String?
    let vacationMode : Int?
    
    enum CodingKeys: String, CodingKey {
        case commentCount = "comment_count"
        case cover
        case createdAt = "created_at"
        case definition
        case followerCount = "follower_count"
        case id
        case isEditorChoice = "is_editor_choice"
        case isFollowing = "is_following"
        case logo
        case name
        case nameUpdateable = "name_updateable"
        case productCount = "product_count"
        case shareUrl = "share_url"
        case shopPaymentId = "shop_payment_id"
        case shopRate = "shop_rate"
        case slug
        case vacationMode = "vacation_mode"
    }
}

public struct Logo: Decodable {
    let height : Int?
    let medium : Medium?
    let thumbnail : Thumbnail?
    let url : String?
    let width : Int?
}
