//
//  NewProductsCollectionViewCell.swift
//  Mobillium_Behlul
//
//  Created by behlul on 22.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit
import Kingfisher

class NewProductsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLable: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with productPresentation: ProductPresentation) {
        self.imageView.kf.setImage(with: productPresentation.imageUrl)
        self.titleLabel.text = productPresentation.title
        self.subtitleLable.text = productPresentation.subtitle
        self.priceLabel.text = productPresentation.price
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = ""
        self.subtitleLable.text = ""
        self.priceLabel.text = ""
    }

}
