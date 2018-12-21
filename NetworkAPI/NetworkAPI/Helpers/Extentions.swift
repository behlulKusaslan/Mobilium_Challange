//
//  Extentions.swift
//  NetworkAPI
//
//  Created by behlul on 21.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

extension URL {
    mutating func regulateImage() {
        var stringUrl = self.absoluteString
        stringUrl = stringUrl.replacingOccurrences(of: "\\/", with: "/")
        if let regulatedUrl = URL(string: stringUrl) {
            self = regulatedUrl
        } else {
            // Should add fix url
        }
    }
    
    func regulateImageUrl() -> URL {
        var stringUrl = self.absoluteString
        stringUrl = stringUrl.replacingOccurrences(of: "\\/", with: "/")
        if let regulatedUrl = URL(string: stringUrl) {
            return regulatedUrl
        } else {
            // Should add fix url
            return self
        }
    }
}
