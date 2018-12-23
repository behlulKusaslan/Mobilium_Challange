//
//  DiscoverDetailViewController.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final class DiscoverDetailViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var customView: DiscoverDetailView!
    
    var state: DiscoverDetailView.State!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.updateCollectionView(state)
    }
}
