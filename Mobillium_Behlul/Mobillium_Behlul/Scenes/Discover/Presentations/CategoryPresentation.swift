//
//  CategoryPresentation.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation
import NetworkAPI

struct CategoryPresentation {
    let imageUrl: URL
    let title: String
}

extension CategoryPresentation {
    init(category: VitrinovaCategory) {
        let imageUrl = category.logo?.medium.url.regulateImageUrl()
        self.init(imageUrl: imageUrl ?? URL(string: "")!,
                  title: category.name)
    }
}
