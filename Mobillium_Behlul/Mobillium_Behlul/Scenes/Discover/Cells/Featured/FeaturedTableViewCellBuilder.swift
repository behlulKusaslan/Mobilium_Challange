//
//  FeaturedTableViewCellBuilder.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final public class FeaturedTableViewCellBuilder {
    
    static func make(with discoverPresentation: DiscoverPresentation?, for tableView: UITableView) -> FeaturedTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedTableViewCell") as? FeaturedTableViewCell ?? FeaturedTableViewCell()
        guard let featureds = discoverPresentation?.featureds else { return cell }
        cell.updateTableViewCell(featureds)
        return cell
    }
    
}
