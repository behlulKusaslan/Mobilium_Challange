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
    @IBOutlet weak var sectionTitle: UILabel!
    
    // variables
    fileprivate var products: [ProductPresentation] = []
    weak var delegate: DiscoverViewDelegate?
    
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
    
    @IBAction func allButtonTapped(_ sender: UIButton) {
        delegate?.didSelectAll(state: DiscoverDetailView.State.newProduct(products))
    }
    
}

extension NewProductsTableViewCell: NewProductsTableViewCellProtocol {
    func updateTableViewCell(_ products: [ProductPresentation], title: String) {
        self.sectionTitle.text = title
        self.products = products
        self.collectionView?.reloadData()
    }
}

// MARK: - UICollectionViewDelegate
extension NewProductsTableViewCell: UICollectionViewDelegate {
    
}

// Mark: - UICollectionViewDataSource
extension NewProductsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return NewProductsCollectionViewCellBuilder.make(with: products, for: collectionView, indexPath: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension NewProductsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
