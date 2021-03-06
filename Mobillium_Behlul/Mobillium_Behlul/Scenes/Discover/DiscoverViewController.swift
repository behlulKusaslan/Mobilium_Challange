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
    @IBOutlet weak var customView: DiscoverView! {
        didSet {
            customView.delegate = self
        }
    }
    
    // Proporties
    var service = DiscoverService()
    private var featureds: [Featured] = []
    private var products: [Product] = []
    private var productsTitle: String = ""
    private var categories: [VitrinovaCategory] = []
    private var categoriesTitle: String = ""
    private var collections: [VitrinovaCollection] = []
    private var collectionsTitle: String = ""
    private var editorShops: [Shop] = []
    private var editorShopsTitle: String = ""
    
    var state = State.loading {
        didSet {
            switch state {
            case .loading:
                customView.setLoading(true)
                getDiscoverData()
            default:
                customView.setLoading(false)
            }
        }
    }
    
    // Mark: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Vitrinova"
        state = .loading
        
//        self.customView.setLoading(true)
//        getDiscoverData()
    }
    
    // MARK: - Functions
    private func getDiscoverData() {
        service.fetchDiscover { [weak self] (result) in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let value):
                strongSelf.state = .ready
                for result in value.responses {
                    if let topFeatured = result as? TopFeatured {
                        strongSelf.featureds = topFeatured.featured
                    }
                    if let products = result as? TopNewProducts {
                        strongSelf.productsTitle = products.title
                        strongSelf.products = products.products
                    }
                    if let categories = result as? TopCategories {
                        strongSelf.categoriesTitle = categories.title
                        strongSelf.categories = categories.categories
                    }
                    if let collections = result as? TopCollections {
                        strongSelf.collectionsTitle = collections.title
                        strongSelf.collections = collections.collections
                    }
                    if let editorShops = result as? TopEditorShops {
                        strongSelf.editorShopsTitle = editorShops.title
                        strongSelf.editorShops = editorShops.shops
                    }
                    if let newShops = result as? TopNewShops {
                        print(newShops.title)
                    }
                }
                strongSelf.updateView()
            case .failure(let error):
                strongSelf.state = .error
                print(error)
            }
            self?.customView.setLoading(false)
        }
    }
    
    private func updateView() {
        // Set presentations
        let featuredPresentationsArray = self.featureds.map(FeaturedPresentation.init)
        let productPresentationsArray = self.products.map(ProductPresentation.init)
        let categoriesPresentationArray = self.categories.map(CategoryPresentation.init)
        let collectionsPresentationArray = self.collections.map(CollectionPresentation.init)
        let editorShopsPresentationArray = self.editorShops.map(EditorShopPresentation.init)
        
        // create base presentation
        let discoverPresentationArray = DiscoverPresentation.init(
            featureds: featuredPresentationsArray,
            productTitle: productsTitle,
            products: productPresentationsArray,
            categoriesTitle: categoriesTitle,
            categories: categoriesPresentationArray,
            collectionsTitle: collectionsTitle,
            collections: collectionsPresentationArray,
            editorShopsTitle: editorShopsTitle,
            editorShops: editorShopsPresentationArray)
        
        self.customView.updateTableView(discoverPresentationArray)
    }
}

// MARK: - DiscoverViewControllerDelegate
extension DiscoverViewController: DiscoverViewControllerDelegate {
    func goToDetailView(with state: DiscoverDetailView.State) {
        let viewController = DiscoverDetailBuilder.make(with: state)
        show(viewController, sender: nil)
    }
}

extension DiscoverViewController {
    enum State {
        case loading
        case ready
        case error
    }
}
