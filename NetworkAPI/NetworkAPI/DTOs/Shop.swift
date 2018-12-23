//
//  Shop.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

public struct Shop: Decodable {
    public let commentCount : Int?
    public let cover : Cover
    public let createdAt : String?
    public let definition : String
    public let followerCount : Int?
    public let id : Int?
    public let isEditorChoice : Bool?
    public let isFollowing : Bool?
    public let logo : Logo?
    public let name : String
    public let nameUpdateable : Bool?
    public let productCount : Int?
    public let shareUrl : String?
    public let shopPaymentId : Int?
    public let popularProducts: [PopularProducts]?
    public let shopRate : Int?
    public let slug : String?
    public let vacationMode : Int?
    
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
        case popularProducts = "popular_products"
        case shopRate = "shop_rate"
        case slug
        case vacationMode = "vacation_mode"
    }
}

public struct PopularProducts: Decodable {
    public let images: [Image]
}
