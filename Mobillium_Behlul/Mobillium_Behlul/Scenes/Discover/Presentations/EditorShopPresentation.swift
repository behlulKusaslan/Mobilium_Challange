//
//  EditorShopPresentation.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation
import NetworkAPI

struct EditorShopPresentation {
    let logoUrl: URL
    let title: String
    let subtitle: String
    let images: [URL] // only 3
    let backgroundImage: URL
}

extension EditorShopPresentation {
    init(shop: Shop) {
        let logoUrl = shop.cover.medium.imageUrl
        let images = [
            shop.popularProducts?[0].images.first?.medium?.imageUrl ?? URL(string: "")!,
            shop.popularProducts?[1].images.first?.medium?.imageUrl ?? URL(string: "")!,
            shop.popularProducts?[2].images.first?.medium?.imageUrl ?? URL(string: "")!
        ]
        let backgroundImage = shop.cover.medium.imageUrl
        self.init(logoUrl: logoUrl,
                  title: shop.name,
                  subtitle: shop.definition,
                  images: images,
                  backgroundImage: backgroundImage)
    }
}
