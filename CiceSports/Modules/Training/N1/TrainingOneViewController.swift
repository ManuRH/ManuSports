//
//  TrainingOneViewController.swift
//  CiceSports
//
//  Created by CICE on 31/05/2021.
//


import UIKit

protocol TrainingOneViewControllerProtocol {
    
}

class TrainingOneViewController: BaseViewController<TrainingOnePresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuButton()
    }
    
}

extension TrainingOneViewController: TrainingOneViewControllerProtocol {
    
    
}
