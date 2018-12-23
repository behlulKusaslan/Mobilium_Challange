//
//  CollectionsTableViewCell.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final class CollectionsTableViewCell: UITableViewCell, XibLoadable {
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var sectionTitle: UILabel!
    
    // Values
    fileprivate var collections: [CollectionPresentation] = []
    
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
        let nib = UINib(nibName: "CollectionsCollectionViewCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: "CollectionsCollectionViewCell")
    }
    
    // MARK: - IBAction
    @IBAction func allButtonTapped(_ sender: UIButton) {
        delegate?.didSelectAll(state: DiscoverDetailView.State.collection(collections))
    }
}

// MARK: - CollectionsTableViewCellProtocol
extension CollectionsTableViewCell: CollectionsTableViewCellProtocol {
    func updaetTableView(_ collections: [CollectionPresentation], title: String) {
        self.collections = collections
        self.sectionTitle.text = title
        self.collectionView?.reloadData()
    }
}

// MARK: - UICollectionViewDelegate
extension CollectionsTableViewCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension CollectionsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return CollectionsCollectionViewCellBuilder.make(with: collections, for: collectionView, indexPath: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
