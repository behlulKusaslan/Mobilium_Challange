//
//  DiscoverView.swift
//  Mobillium_Behlul
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final class DiscoverView: UIView {
    
    // Outlets
    @IBOutlet weak private var tableView: UITableView!
    
    // Variables
    private var discoverPresentation: DiscoverPresentation?
    
}

// MARK: - DiscoverViewProtocol
extension DiscoverView: DiscoverViewProtocol {
    
    func updateTableView(_ discoverPresentation: DiscoverPresentation) {
        self.discoverPresentation = discoverPresentation
        tableView.reloadData()
    }
    
    func setLoading(_ isloading: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = isloading
    }
    
}

// MARK: - UITableViewDelegate
extension DiscoverView: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension DiscoverView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case CellType.featured.rawValue:
            return FeaturedTableViewCellBuilder.make(with: discoverPresentation, for: tableView)
        case CellType.newProduct.rawValue:
            return NewProductsTableViewCellBuilder.make(with: discoverPresentation, for: tableView)
        case CellType.categories.rawValue:
            return CategoriesTableViewCellBuilder.make(with: discoverPresentation, for: tableView)
        case CellType.collections.rawValue:
            return CollectionsTableViewCellBuilder.make(with: discoverPresentation, for: tableView)
        // TODO:
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case CellType.featured.rawValue: return 150
        case CellType.newProduct.rawValue: return 230
        case CellType.categories.rawValue: return 115
        case CellType.collections.rawValue: return 150
        default: return 0
        }
    }
}

// Mark: - CellType
extension DiscoverView {
    enum CellType: Int, CaseIterable {
        case featured = 0, newProduct, categories, collections, editorShops, newShops
    }
}
