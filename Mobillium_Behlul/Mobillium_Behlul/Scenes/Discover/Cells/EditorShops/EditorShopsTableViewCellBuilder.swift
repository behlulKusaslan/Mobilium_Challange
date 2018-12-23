//
//  EditorShopsTableViewCellBuilder.swift
//  Mobillium_Behlul
//
//  Created by behlul on 23.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final public class EditorShopsTableViewCellBuilder {
    
    static func make(with discoverPresentation: DiscoverPresentation?, for tableView: UITableView) -> EditorShopsTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditorShopsTableViewCell") as? EditorShopsTableViewCell ?? EditorShopsTableViewCell()
        guard let editorShops = discoverPresentation?.editorShops else { return cell }
        guard let title = discoverPresentation?.editorShopsTitle else { return cell }
        cell.updaetTableView(editorShops, title: title)
        return cell
    }
    
}
