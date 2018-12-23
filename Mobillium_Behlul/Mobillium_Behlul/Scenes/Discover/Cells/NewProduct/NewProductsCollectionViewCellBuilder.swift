//
//  NewProductsCollectionViewCellBuilder.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final public class NewProductsCollectionViewCellBuilder {
    
    static func make(with products: [ProductPresentation], for collectionView: UICollectionView, indexPath: IndexPath) -> NewProductsCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewProductsCollectionViewCell", for: indexPath) as? NewProductsCollectionViewCell ?? NewProductsCollectionViewCell()
        let productPresentation = products[indexPath.row]
        cell.configureCell(with: productPresentation)
        return cell
    }
    
}
