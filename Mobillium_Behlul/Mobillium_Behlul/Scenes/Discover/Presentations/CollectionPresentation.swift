//
//  CollectionPresentation.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation
import NetworkAPI

struct CollectionPresentation {
    let imageUrl: URL
    let title: String
    let subtitle: String
}

extension CollectionPresentation {
    init(collection: VitrinovaCollection) {
        self.init(imageUrl: collection.cover.medium.imageUrl,
                  title: collection.title,
                  subtitle: collection.definition)
    }
}
