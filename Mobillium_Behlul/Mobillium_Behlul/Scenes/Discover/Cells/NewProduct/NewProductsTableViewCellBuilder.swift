//
//  NewProductsTableViewCellBuilder.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final public class NewProductsTableViewCellBuilder {
    
    static func make(with discoverPresentation: DiscoverPresentation?, for tableView: UITableView) -> NewProductsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewProductsTableViewCell") as? NewProductsTableViewCell ?? NewProductsTableViewCell()
        guard let products = discoverPresentation?.products else { return cell }
        guard let title = discoverPresentation?.productTitle else { return cell }
        cell.updateTableViewCell(products, title: title)
        return cell
    }
    
}
