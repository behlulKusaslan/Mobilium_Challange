//
//  Extentions.swift
//  NetworkAPI
//
//  Created by behlul on 21.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

extension URL {
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

extension Int {
    func priceFormatter() -> String {
        let nsNumber = self as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        guard let priceString = formatter.string(from: nsNumber) else { return "" }
        return priceString
    }
}
