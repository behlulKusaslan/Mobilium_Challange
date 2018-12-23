//
//  EditorShopsCollectionViewCell.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit
import Kingfisher

class EditorShopsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with editorShop: EditorShopPresentation) {
        self.logoView.kf.setImage(with: editorShop.logoUrl)
        self.titleLabel.text = editorShop.title
        self.subtitleLabel.text = editorShop.subtitle
        self.imageView1.kf.setImage(with: editorShop.images[0])
        self.imageView2.kf.setImage(with: editorShop.images[1])
        self.imageView3.kf.setImage(with: editorShop.images[2])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.logoView.image = nil
        self.titleLabel.text = nil
        self.subtitleLabel.text = nil
        self.imageView1.image = nil
        self.imageView2.image = nil
        self.imageView3.image = nil
    }

}
