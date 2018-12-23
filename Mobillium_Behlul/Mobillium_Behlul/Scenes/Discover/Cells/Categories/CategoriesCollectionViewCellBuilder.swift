//
//  CategoriesCollectionViewCellBuilder.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final public class CategoriesCollectionViewCellBuilder {
    
    static func make(with categories: [CategoryPresentation], for collectionView: UICollectionView, indexPath: IndexPath) -> CategoriesCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as? CategoriesCollectionViewCell ?? CategoriesCollectionViewCell()
        let categoryPresentation = categories[indexPath.row]
        cell.configureCell(with: categoryPresentation)
        return cell
    }
    
}
