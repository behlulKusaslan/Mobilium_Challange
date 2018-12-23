//
//  EditorShopsCollectionViewCellBuilder.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final public class EditorShopsCollectionViewCellBuilder {
    
    static func make(with editorShops: [EditorShopPresentation], for collectionView: UICollectionView, indexPath: IndexPath) -> EditorShopsCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EditorShopsCollectionViewCell", for: indexPath) as? EditorShopsCollectionViewCell ?? EditorShopsCollectionViewCell()
        let editorShopPresentation = editorShops[indexPath.row]
        cell.configureCell(with: editorShopPresentation)
        return cell
    }
    
}
