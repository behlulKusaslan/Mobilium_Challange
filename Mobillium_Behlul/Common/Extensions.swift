//
//  Extensions.swift
//  Mobillium_Behlul
//
//  Created by behlul on 24.12.2018.
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
            // May add fix url
            return self
        }
    }
}

extension Int {
    static let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "tr_TR")
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    var priceFormatted: String {
        let nsNumber = self as NSNumber
        guard let priceString = Int.priceFormatter.string(from: nsNumber) else { return "" }
        return priceString
    }
}
