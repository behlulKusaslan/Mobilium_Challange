//
//  CategoriesTableViewCell.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final class CategoriesTableViewCell: UITableViewCell, XibLoadable {
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var sectionTitle: UILabel!
    
    // Variables
    fileprivate var categories: [CategoryPresentation] = []
    
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
        let nib = UINib(nibName: "CategoriesCollectionViewCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }
}

extension CategoriesTableViewCell: CategoryTableViewCellProtocol {
    func updateTableView(_ categories: [CategoryPresentation], title: String) {
        self.sectionTitle.text = title
        self.categories = categories
        self.collectionView?.reloadData()
    }
}

// MARK: - UICollectionViewDelegate
extension CategoriesTableViewCell: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension CategoriesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as? CategoriesCollectionViewCell ?? CategoriesCollectionViewCell()
        let categoryPresentation = categories[indexPath.row]
        cell.configureCell(with: categoryPresentation)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
