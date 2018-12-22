//
//  NewProductsTableViewCell.swift
//  Mobillium_Behlul
//
//  Created by behlul on 21.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final class NewProductsTableViewCell: UITableViewCell, XibLoadable {
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView?
    
    // variables
    fileprivate var productPresentations: [ProductPresentation] = []
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //loadViewFromXib()
        setUpCell()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        loadViewFromXib()
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadViewFromXib()
        setUpCell()
    }
    
    private func setUpCell() {
        collectionView?.dataSource = self
        collectionView?.delegate = self
        let nib = UINib(nibName: "NewProductsCollectionViewCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: "NewProductsCollectionViewCell")
    }
    
}

extension NewProductsTableViewCell: UICollectionViewDelegate {
    
}

extension NewProductsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14 //productPresentations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewProductsCollectionViewCell", for: indexPath) as? NewProductsCollectionViewCell ?? NewProductsCollectionViewCell()
        return cell
    }
}
