//
//  CategoriesTableViewCellBuilder.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final public class CategoriesTableViewCellBuilder {
    
    static func make(with discoverPresentation: DiscoverPresentation?, for tableView: UITableView) -> CategoriesTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell") as? CategoriesTableViewCell ?? CategoriesTableViewCell()
        guard let categories = discoverPresentation?.categories else { return cell }
        guard let title = discoverPresentation?.categoriesTitle else { return cell }
        cell.updateTableView(categories, title: title)
        return cell
    }
    
}
