//
//  Shop.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

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
