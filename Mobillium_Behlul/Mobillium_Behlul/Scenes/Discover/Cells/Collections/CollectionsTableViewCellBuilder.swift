//
//  CollectionsTableViewCellBuilder.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final public class CollectionsTableViewCellBuilder {
    
    static func make(with discoverPresentation: DiscoverPresentation?, for tableView: UITableView) -> CollectionsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionsTableViewCell") as? CollectionsTableViewCell ?? CollectionsTableViewCell()
        guard let collections = discoverPresentation?.collections else { return cell }
        guard let title = discoverPresentation?.categoriesTitle else { return cell }
        cell.updaetTableView(collections, title: title)
        return cell
    }
    
}
