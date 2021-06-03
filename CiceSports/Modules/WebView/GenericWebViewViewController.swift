//
//  GenericWebViewViewController.swift
//  CiceSports
//
//  Created by CICE on 01/06/2021.
//

import UIKit

protocol GenericWebViewViewControllerProtocol {
    
}

class GenericWebViewViewController: BaseViewController<GenericWebViewPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
}

extension GenericWebViewViewController: GenericWebViewViewControllerProtocol {
    
    
}
