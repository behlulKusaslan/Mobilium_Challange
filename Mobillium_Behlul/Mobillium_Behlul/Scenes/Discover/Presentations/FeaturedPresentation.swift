//
//  FeaturedPresentation.swift
//  Mobillium_Behlul
//
//  Created by behlul on 21.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation
import NetworkAPI

struct FeaturedPresentation {
    let imageUrl: URL
    let title: String
    let subtitle: String
}

extension FeaturedPresentation {
    init(featured: Featured) {
        let imageUrl = featured.cover.url.regulateImageUrl()
        self.init(imageUrl: imageUrl, title: featured.title, subtitle: featured.subTitle)
    }
}
