//
//  AppAssembly.swift
//  CiceSports
//
//  Created by CICE on 25/05/2021.
//

import Foundation
import UIKit

protocol AppAssemblyProtocol {
    func setPrincipalViewController(in window: UIWindow)
}

class AppAssembly: AppAssemblyProtocol {
    
    var actualViewController: UIViewController!
    public typealias HTTPHeaders = [String: String]
    
    internal func setPrincipalViewController(in window: UIWindow){
        self.customUI()
        actualViewController = SplashAssembly.splashViewController()//SplashAssembly.splashNavigationController()
        window.rootViewController = actualViewController
        window.makeKeyAndVisible()
    }
    
    internal func createSlidingMenu(window: UIWindow, vc: UIViewController, menu:  [MenuResponse]){
        self.customUI()
        let frontViewController = vc
        let rearViewController = MenuAssembly.viewController(menu: dataDTO.init(menu: menu))
        let swRevealVC = SWRevealViewController(rearViewController: rearViewController, frontViewController: frontViewController)
        swRevealVC?.toggleAnimationType = SWRevealToggleAnimationType.easeOut
        swRevealVC?.toggleAnimationDuration = 0.30
        window.rootViewController = swRevealVC
        window.makeKeyAndVisible()
    }
    
    fileprivate func customUI() {
        let navBar = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        //let toolBar = UIToolbar.appearance()
        navBar.barTintColor = #colorLiteral(red: 0.17873469, green: 0.1787717044, blue: 0.178729862, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.17873469, green: 0.1787717044, blue: 0.178729862, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navBar.barStyle = .black
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    }
    
    public static let defaultHTTPHeaders: HTTPHeaders = {
        let BearerAuthentication = AuthHeroku.authHeroku
        return [
            "Authorization": BearerAuthentication
        ]
    }()
}
