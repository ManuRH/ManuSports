//
//  ReuseIdentifier.swift
//  CiceSports
//
//  Created by CICE on 25/05/2021.
//

import Foundation
import UIKit

public protocol ReuseIdentifierInterface: class{
    static var defaultReuseIdentifier: String{ get }
}

public extension ReuseIdentifierInterface where Self: UIView{
    static var defaultReuseIdentifier: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

public protocol ReuseIdentifierInterfaceViewController: class{
    static var defaultReuseIdentifierViewController: String{ get }
}

public extension ReuseIdentifierInterfaceViewController where Self: UIViewController{
    static var defaultReuseIdentifierViewController: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UIViewController {
    
    func menuButton() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_Iz"), style: .plain, target: revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        revealViewController()?.rightViewRevealWidth = 150
        revealViewController()?.panGestureRecognizer()
        self.navigationItem.leftBarButtonItem = menuButton
    }
}


func showImageMenuWithName(imageMenu: Menu) -> UIImage {
    switch imageMenu.imagen {
    case "iconoAvatar":
        return #imageLiteral(resourceName: "imagenLanzamientoApp")
    case "musicAvatar":
        return #imageLiteral(resourceName: "musicAvatar")
    case "calendarioAvatar":
        return #imageLiteral(resourceName: "calendarioAvatar")
    case "consejosAvatar":
        return #imageLiteral(resourceName: "consejosAvatar")
    default:
        return #imageLiteral(resourceName: "nosotrosAvatar")
    }
}
