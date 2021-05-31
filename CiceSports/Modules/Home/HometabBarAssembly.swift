//
//  HometabBarAssembly.swift
//  CiceSports
//
//  Created by CICE on 29/05/2021.
//

import Foundation
import UIKit

final public class HometabBarAssembly {
    
    static func homeTabBarViewController() -> HomeTabBarViewController {
        let viewController = HomeTabBarViewController(nibName: HomeTabBarViewController.defaultReuseIdentifierViewController, bundle: nil)
        
        let oneViewController = TrainingOneAssembly.navigationController()
        let twoViewController = TrainingTwoAssembly.navigationController()
        
        let oneCustomTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "TRIFECA_0M"), selectedImage: UIImage(named: "TRIFECA_0M"))
        let twoCustomTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "TRIFECA_1M"), selectedImage: UIImage(named: "TRIFECA_1M"))
        
        oneViewController.tabBarItem = oneCustomTabBarItem
        twoViewController.tabBarItem = twoCustomTabBarItem
        
        viewController.viewControllers = [oneViewController, twoViewController]
        
        switch viewController.selectedIndex {
        case 0:
            "Nivel 1"
        default:
            "Nivel 2"
        }
        
        return viewController
    }
}

