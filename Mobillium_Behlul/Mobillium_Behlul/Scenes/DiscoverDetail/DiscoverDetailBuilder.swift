//
//  DiscoverDetailBuilder.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final public class DiscoverDetailBuilder {
    
    static func make(with state: DiscoverDetailView.State) -> DiscoverDetailViewController {
        let storyBoard = UIStoryboard(name: "DiscoverDetail", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "DiscoverDetailViewController") as! DiscoverDetailViewController
        viewController.state = state
        return viewController
    }
    
}
