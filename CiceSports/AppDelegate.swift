//
//  AppDelegate.swift
//  CiceSports
//
//  Created by CICE on 25/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appAssembly: AppAssemblyProtocol = AppAssembly()
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let windowDes = window {
            appAssembly.setPrincipalViewController(in: windowDes)
        }
        
        return true
    }


}

