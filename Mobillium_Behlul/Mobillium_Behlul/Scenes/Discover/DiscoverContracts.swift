//
//  DiscoverContracts.swift
//  Mobillium_Behlul
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import Foundation

protocol DiscoverViewProtocol {
    func updateTableView(_ discoverPresentation: DiscoverPresentation)
    func setLoading(_ isloading: Bool)
}

protocol DiscoverViewDelegate: class {
    func didSelectAll(state: DiscoverDetailView.State)
}

protocol DiscoverViewControllerDelegate: class {
    func goToDetailView(with state: DiscoverDetailView.State)
}

protocol FeaturedTableViewCellProtocol {
    func updateTableViewCell(_ featureds: [FeaturedPresentation])
}

protocol NewProductsTableViewCellProtocol {
    func updateTableViewCell(_ products: [ProductPresentation], title: String)
}

protocol CategoryTableViewCellProtocol {
    func updateTableView(_ categories: [CategoryPresentation], title: String)
}

protocol CollectionsTableViewCellProtocol {
    func updaetTableView(_ collections: [CollectionPresentation], title: String)
}

protocol EditorShopsTableViewCellProtocol {
    func updaetTableView(_ editorShops: [EditorShopPresentation], title: String)
}
