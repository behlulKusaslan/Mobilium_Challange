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
        guard let count = discoverPresentation?.featureds.count else { return 0}
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let featured = discoverPresentation?.featureds[indexPath.row] else { return cell }
        cell.textLabel?.text = featured.title
        cell.detailTextLabel?.text = featured.subtitle
        return cell
    }
}
