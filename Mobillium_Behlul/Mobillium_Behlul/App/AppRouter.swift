//
//  AppRouter.swift
//  Mobillium_Behlul
//
//  Created by behlul on 20.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let viewController = DiscoverBuilder.make()
        var navigationController = UINavigationController(rootViewController: viewController)
        navigationController = setUpNavigationBarStyle(for: navigationController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    private func setUpNavigationBarStyle(for navigationController: UINavigationController) -> UINavigationController {
        navigationController.navigationBar.barTintColor = UIColor.orange
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navigationController
    }
    
}
