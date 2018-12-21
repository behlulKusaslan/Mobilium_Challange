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
    
    // Outlets
    @IBOutlet weak var customView: DiscoverView!
    
    // Proporties
    var service = DiscoverService()
    private var featureds: [Featured] = []
    private var productTitle: String = ""
    private var products: [Product] = []
    
    // Mark: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Vitrinova"
        
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
                        strongSelf.productTitle = products.title
                        strongSelf.products = products.products
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
                strongSelf.updateView()
            case .failure(let error):
                print(error)
            }
            self?.customView.setLoading(false)
        }
    }
    
    private func updateView() {
        // Set presentations
        let featuredPresentationsArray = self.featureds.map(FeaturedPresentation.init)
        let productPresentationsArray = self.products.map(ProductPresentation.init)
        
        // create base presentation
        let discoverPresentationArray = DiscoverPresentation.init(
            featureds: featuredPresentationsArray,
            productTitle: productTitle,
            products: productPresentationsArray)
        
        self.customView.updateTableView(discoverPresentationArray)
    }
}
