//
//  CollectionsCollectionViewCellBuilder.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final public class CollectionsCollectionViewCellBuilder {
    
    static func make(with collections: [CollectionPresentation], for collectionView: UICollectionView, indexPath: IndexPath) -> CollectionsCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionsCollectionViewCell", for: indexPath) as? CollectionsCollectionViewCell ?? CollectionsCollectionViewCell()
        let collectionPresentation = collections[indexPath.row]
        cell.configureCell(with: collectionPresentation)
        return cell
    }
    
}
