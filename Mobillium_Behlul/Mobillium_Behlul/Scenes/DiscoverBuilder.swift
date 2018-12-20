//
//  DiscoverBuilder.swift
//  Mobillium_Behlul
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final class DiscoverBuilder {
    
    static func make() -> DiscoverViewController {
        let storyBoard = UIStoryboard(name: "Discover", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "DiscoverViewController") as! DiscoverViewController
        //viewController.service = app.service
        return viewController
    }
    
}
