//
//  ViewController.swift
//  Mobillium_Behlul
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit
import NetworkAPI
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var service = DiscoverService()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        service.fetchDiscover { [weak self] (result) in
//            guard let strongSelf = self else { return }
            switch result {
            case .success(let value):
                for result in value.responses {
                    if let featured = result as? TopFeatured {
                        print(featured.title)
                        //debugPrint(featured.featured)
                    }
                    if let products = result as? TopNewProducts {
                        print(products.title)
                        //debugPrint(products.products)
                    }
                    if let categories = result as? TopCategories {
                        print(categories.title)
                        //debugPrint(categories.categories)
                    }
                    if let collections = result as? TopCollections {
                        print(collections.title)
                    }
                    if let editorShops = result as? TopEditorShops {
                        print(editorShops.title)
                    }
                    if let newShops = result as? TopNewShops {
                        print(newShops.title)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
        // image
        let url = URL(string: "https://www.maxpixel.net/static/photo/1x/Fashion-Model-Woman-Clothes-Style-Female-3497401.jpg")!
        imageView.kf.setImage(with: url)
    }


}

