//
//  ProductPresentation.swift
//  Mobillium_Behlul
//
//  Created by behlul on 21.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation
import NetworkAPI

struct ProductPresentation {
    let imageUrl: URL
    let title: String
    let subtitle: String
    let price: String
}

extension ProductPresentation {
    init(product: Product) {
        self.init(
            imageUrl: product.shop.cover.medium.imageUrl,
            title: product.title,
            subtitle: product.shop.name,
            price: product.priceString)
    }
}
