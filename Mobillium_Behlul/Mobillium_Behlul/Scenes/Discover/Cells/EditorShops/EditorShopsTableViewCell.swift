//
//  EditorShopsTableViewCell.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit
import Kingfisher

final class EditorShopsTableViewCell: UITableViewCell, XibLoadable {
    
    // Outlets
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    // Values
    fileprivate var editorShops: [EditorShopPresentation] = []
    
    weak var delegate: DiscoverViewDelegate?
    
    //
    private var indexOfCellBeforeDragging = 0
    private var collectionViewFlowLayout: UICollectionViewFlowLayout {
        return collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
    }
    
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
        let nib = UINib(nibName: "EditorShopsCollectionViewCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: "EditorShopsCollectionViewCell")
        collectionViewFlowLayout.minimumLineSpacing = 0
    }
    
    private func indexOfMajorCell() -> Int {
        let itemWidth: CGFloat = 300
        let proportionalOffset = (collectionView?.collectionViewLayout.collectionView!.contentOffset.x ?? 0) / itemWidth
        let index = Int(round(proportionalOffset))
        let numberOfItems = collectionView?.numberOfItems(inSection: 0) ?? 0
        let safeIndex = max(0, min(numberOfItems - 1, index))
        return safeIndex
    }
    
    @IBAction func allButtonTapped(_ sender: UIButton) {
        delegate?.didSelectAll(state: DiscoverDetailView.State.editorShops(editorShops))
    }
    
}

extension EditorShopsTableViewCell: EditorShopsTableViewCellProtocol {
    func updaetTableView(_ editorShops: [EditorShopPresentation], title: String) {
        self.sectionTitle.text = title
        self.editorShops = editorShops
        if let backgroundImageUrl = editorShops.first?.backgroundImage {
            self.backgroundImageView.kf.setImage(with: backgroundImageUrl)
        }
        self.collectionView?.reloadData()
    }
}

// MARK: - UICollectionViewDelegate
extension EditorShopsTableViewCell: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // Stop scrollView sliding:
        targetContentOffset.pointee = scrollView.contentOffset
        // Calculate where scrollView should snap to:
        let indexOfMajorCell = self.indexOfMajorCell()
        let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
        collectionViewFlowLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        let backgroundImageUrl = editorShops[indexPath.row].backgroundImage
        self.backgroundImageView.kf.setImage(with: backgroundImageUrl)
    }
}

// MARK: - UICollectionViewDataSource
extension EditorShopsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return editorShops.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return EditorShopsCollectionViewCellBuilder.make(with: editorShops, for: collectionView, indexPath: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension EditorShopsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
}
