//
//  MainTabBarController.swift
//  Makestagram
//
//  Created by Oscar Chan on 7/5/17.
//  Copyright © 2017 Oscar Chan. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoHelper.completionHandler = { image in
            PostService.create(for: image)
            //print("handle image")
        }
        
        // 1
        delegate = self
        // 2
        tabBar.unselectedItemTintColor = .black
    }
    // MARK: - Properties
    
    let photoHelper = MGPhotoHelper()
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            // present photo taking action sheet
            //print("take photo")
            photoHelper.presentActionSheet(from: self)
            
            return false
        }
            return true
    }
}
