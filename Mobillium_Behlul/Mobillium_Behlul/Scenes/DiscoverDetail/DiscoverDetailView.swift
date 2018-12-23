//
//  DiscoverDetailView.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final class DiscoverDetailView: UIView {
    
    // Outlets
    @IBOutlet weak private var collectionView: UICollectionView!
    
    var state = State.empty
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUpCell()
    }
    
    private func setUpCell() {
        collectionView?.dataSource = self
        collectionView?.delegate = self
        switch self.state {
        case .newProduct(_):
            let nib = UINib(nibName: "NewProductsCollectionViewCell", bundle: nil)
            collectionView?.register(nib, forCellWithReuseIdentifier: "NewProductsCollectionViewCell")
        case .collection(_):
            let nib = UINib(nibName: "CollectionsCollectionViewCell", bundle: nil)
            collectionView?.register(nib, forCellWithReuseIdentifier: "CollectionsCollectionViewCell")
        case .editorShops(_):
            let nib = UINib(nibName: "EditorShopsCollectionViewCell", bundle: nil)
            collectionView?.register(nib, forCellWithReuseIdentifier: "EditorShopsCollectionViewCell")
        default:
            print("No cell")
        }
        
    }
    
}

// MARK: - UICollectionViewDelegate
extension DiscoverDetailView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension DiscoverDetailView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.state {
        case .empty: return 0
        case .newProduct(let newProducts): return newProducts.count
        case .collection(let collections): return collections.count
        case .editorShops(let editorsShop): return editorsShop.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch self.state {
        case .empty: return UICollectionViewCell()
        case .newProduct(let newProducts):
            return NewProductsCollectionViewCellBuilder.make(with: newProducts, for: collectionView, indexPath: indexPath)
        case .collection(let collections):
            return CollectionsCollectionViewCellBuilder.make(with: collections, for: collectionView, indexPath: indexPath)
        case .editorShops(let editorShops):
            return EditorShopsCollectionViewCellBuilder.make(with: editorShops, for: collectionView, indexPath: indexPath)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DiscoverDetailView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch self.state {
        case .empty:
            return CGSize(width: 0, height: 0)
        case .newProduct(_):
            let width = roundf(Float((self.frame.size.width - 40) / 2))
            return CGSize(width: CGFloat(width), height: 300)
        case .collection(_), .editorShops(_):
            return CGSize(width: self.frame.size.width - 20, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

// MARK: - DiscoverDetailViewProtocol
extension DiscoverDetailView: DiscoverDetailViewProtocol {
    func updateCollectionView(_ state: DiscoverDetailView.State) {
        self.state = state
        self.setUpCell()
        self.collectionView.reloadData()
    }
}

// MARK: - State
extension DiscoverDetailView {
    enum State {
        case empty
        case newProduct([ProductPresentation])
        case collection([CollectionPresentation])
        case editorShops([EditorShopPresentation])
    }
}
