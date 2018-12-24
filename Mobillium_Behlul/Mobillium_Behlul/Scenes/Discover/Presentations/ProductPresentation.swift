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
        let price = product.price.priceFormatted
        let imageUrl = product.images.first?.url.regulateImageUrl()
        self.init(
            imageUrl: imageUrl ?? URL(string: "")!,
            title: product.title,
            subtitle: product.shop.name,
            price: price)
    }
}
