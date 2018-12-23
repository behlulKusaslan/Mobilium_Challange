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

protocol FeaturedTableViewCellProtocol {
    func updateTableViewCell(_ featureds: [FeaturedPresentation])
}

protocol NewProductsTableViewCellProtocol {
    func updateTableViewCell(_ products: [ProductPresentation], title: String)
}

protocol CategoryTableViewCellProtocol {
    func updateTableView(_ categories: [CategoryPresentation], title: String)
}
