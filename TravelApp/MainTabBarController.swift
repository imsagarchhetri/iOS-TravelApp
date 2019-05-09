//
//  MainTabBarController.swift
//  TravelApp
//
//  Created by Sagar on 16/2/19.
//  Copyright © 2019 Sagar. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.delegate = self
        setupTabBarController()
    }
    
    func setupTabBarController() {
        let homeNavController = templateNavController(unselected: #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal), selected: #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal), rootViewController: HomeController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        let popularController = templateNavController(unselected: #imageLiteral(resourceName: "like"), selected: #imageLiteral(resourceName: "like"))
        
        let categoriesController = templateNavController(unselected: #imageLiteral(resourceName: "item#4"), selected: #imageLiteral(resourceName: "item#4"))
        let profileController = templateNavController(unselected: #imageLiteral(resourceName: "item#5"), selected: #imageLiteral(resourceName: "item#5"))
        
        tabBar.tintColor = UIColor.rgb(red: 86, green: 128, blue: 250, alpha: 1)
        tabBar.barTintColor = .white
        tabBar.unselectedItemTintColor = UIColor.rgb(red: 175, green: 194, blue: 251, alpha: 1)
        viewControllers = [homeNavController, popularController, categoriesController,profileController ]
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        }
        
        
    }
    
    fileprivate func templateNavController(unselected: UIImage, selected: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        viewController.tabBarItem.image = unselected
        viewController.tabBarItem.selectedImage = selected
        
        return navController
    }
    
    
    




}
