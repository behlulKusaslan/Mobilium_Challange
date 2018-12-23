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
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedTableViewCell") as? FeaturedTableViewCell ?? FeaturedTableViewCell()
            guard let featureds = discoverPresentation?.featureds else { return cell }
            cell.updateTableViewCell(featureds)
            return cell
        case CellType.newProduct.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewProductsTableViewCell") as? NewProductsTableViewCell ?? NewProductsTableViewCell()
            guard let products = discoverPresentation?.products else { return cell }
            guard let title = discoverPresentation?.productTitle else { return cell }
            cell.updateTableViewCell(products, title: title)
            return cell
        case CellType.categories.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell") as? CategoriesTableViewCell ?? CategoriesTableViewCell()
            guard let categories = discoverPresentation?.categories else { return cell }
            guard let title = discoverPresentation?.categoriesTitle else { return cell }
            cell.updateTableView(categories, title: title)
            return cell
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
