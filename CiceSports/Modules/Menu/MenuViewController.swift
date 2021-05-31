//
//  MenuViewController.swift
//  CiceSports
//
//  Created by CICE on 31/05/2021.
//

import UIKit

protocol MenuViewControllerProtocol {
    
}

class MenuViewController: BaseViewController<MenuPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
}

extension MenuViewController: MenuViewControllerProtocol {
    
}
