//
//  TopResponse.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

public class BaseResponse: Decodable {
    public let type: String
    public let title: String
    
    private enum CodingKeys: String, CodingKey {
        case type
        case title
    }
}

public struct TopResponses: Decodable {
    
    public let responses: [BaseResponse]
    
    enum ResponseTypeKey: CodingKey {
        case type
//        case title
    }
    
    enum ResponseTypes: String, Decodable {
        case featured
        case newProducts = "new_products"
        case categories
        case collections
        case editorShops = "editor_shops"
        case newShops = "new_shops"
    }
    
    public init(from decoder: Decoder) throws {
//        var container = try decoder.unkeyedContainer()
        var responseArrayForType = try decoder.unkeyedContainer() //try container.nestedUnkeyedContainer()
        var responses: [BaseResponse] = []
        
        var responseArray = responseArrayForType
        while !responseArrayForType.isAtEnd {
            let response = try responseArrayForType.nestedContainer(keyedBy: ResponseTypeKey.self)
            //let response = try responseArrayForType.nestedUnkeyedContainer()
            
            let type = try response.decode(ResponseTypes.self, forKey: TopResponses.ResponseTypeKey.type)
            switch type {
            case .featured:
                let featureds = try responseArray.decode(TopFeatured.self)
                responses.append(featureds)
            case .newProducts:
                let newProducts = try responseArray.decode(TopNewProducts.self)
                responses.append(newProducts)
            case .categories:
                let newCategories = try responseArray.decode(TopCategories.self)
                responses.append(newCategories)
            case .collections:
                let newCollections = try responseArray.decode(TopCollections.self)
                responses.append(newCollections)
            case .editorShops:
                let newEditorShops = try responseArray.decode(TopEditorShops.self)
                responses.append(newEditorShops)
            case .newShops:
                let newNewShops = try responseArray.decode(TopNewShops.self)
                responses.append(newNewShops)
            }
        }
        self.responses = responses
    }
    
}
