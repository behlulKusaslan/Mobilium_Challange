//
//  CategoriesCollectionViewCell.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit
import Kingfisher

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with categoryPresentation: CategoryPresentation) {
        self.imageView.kf.setImage(with: categoryPresentation.imageUrl)
        self.titleLabel.text = categoryPresentation.title
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
        self.titleLabel.text = nil
    }

}
