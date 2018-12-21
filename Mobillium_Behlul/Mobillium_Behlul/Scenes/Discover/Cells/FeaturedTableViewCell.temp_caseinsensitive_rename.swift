//
//  FeaturedTableViewCell.swift
//  Mobillium_Behlul
//
//  Created by behlul on 21.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final class FeaturedTableViewCell: UITableViewCell, XibLoadable {
    
    // Outlets
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //loadViewFromXib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        loadViewFromXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadViewFromXib()
    }
}
