//
//  DiscoverViewController.swift
//  Mobillium_Behlul
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit
import NetworkAPI
import Kingfisher

final class DiscoverViewController: UIViewController {
    
    @IBOutlet weak var customView: DiscoverView!
    
    var service = DiscoverService()
    private var featureds: [Featured] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customView.setLoading(true)
        
        getDiscoverData()
    }
    
    // MARK: - Functions
    private func getDiscoverData() {
        service.fetchDiscover { [weak self] (result) in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let value):
                for result in value.responses {
                    if let topFeatured = result as? TopFeatured {
                        print(topFeatured.title)
                        //debugPrint(featured.featured)
                        strongSelf.featureds = topFeatured.featured
                    }
                    if let products = result as? TopNewProducts {
                        print(products.title)
                        //debugPrint(products.products)
                    }
                    if let categories = result as? TopCategories {
                        print(categories.title)
                        //debugPrint(categories.categories)
                    }
                    if let collections = result as? TopCollections {
                        print(collections.title)
                    }
                    if let editorShops = result as? TopEditorShops {
                        print(editorShops.title)
                    }
                    if let newShops = result as? TopNewShops {
                        print(newShops.title)
                    }
                }
                let featuredPresentationsArray = strongSelf.featureds.map(FeaturedPresentation.init)
                debugPrint(featuredPresentationsArray)
                let discoverPresentationArray = DiscoverPresentation.init(featureds: featuredPresentationsArray)
                debugPrint(discoverPresentationArray)
                strongSelf.customView.updateTableView(discoverPresentationArray)
            case .failure(let error):
                print(error)
            }
            self?.customView.setLoading(false)
        }
    }
}
