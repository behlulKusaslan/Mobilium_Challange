//
//  DiscoverService.swift
//  NetworkAPI
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation
import Moya

protocol DiscoverServiceProtocol {
    func fetchDiscover(completion: @escaping (Result<TopResponses>) -> Void)
}

public final class DiscoverService: DiscoverServiceProtocol {
    
    private let discoverProvider = MoyaProvider<DiscoverTarget>()
    
    public enum Error: Swift.Error {
        case serilizationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public init() { }
    
    public func fetchDiscover(completion: @escaping (Result<TopResponses>) -> Void) {
        discoverProvider.request(.getDiscover) { (result) in
            switch result {
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(TopResponses.self, from: value.data )
                    completion(Result.success(response))
                } catch {
                    completion(Result.failure(Error.serilizationError(internal: error)))
                }
            case .failure(let error):
                completion(Result.failure(Error.networkError(internal: error)))
            }
        }
    }
}
