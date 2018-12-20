//
//  DiscoverTarget.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation
import Moya

public enum DiscoverTarget {
    case getDiscover
}

extension DiscoverTarget: TargetType {
    // https://www.vitrinova.com/api/v2/discover
    public var baseURL: URL {
        return URL(string: "https://www.vitrinova.com/api/v2")!
    }
    
    public var path: String {
        switch self {
        case .getDiscover: return "/discover"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getDiscover: return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getDiscover: return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return [
            "Content-Type" : "application/json"
        ]
    }
}
