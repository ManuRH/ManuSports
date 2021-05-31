//
//  SplashPresenterImpl.swift
//  CiceSports
//
//  Created by CICE on 25/05/2021.
//

import Foundation

protocol SplashPresenterProtocol {
    func fetchDataFromHeroku()
    func showHomeTabBar()
}

class SplashPresenterImpl: BasePresenter<SplashViewControllerProtocol, SplashRouterProtocol> {
    
    var interactor: SplashInteractorProtocol?
    var viewModel: [MenuResponse] = []
}

extension SplashPresenterImpl: SplashPresenterProtocol {
    
    internal func fetchDataFromHeroku(){
        self.interactor?.fetchDataFromHerokuBusiness(success: { [weak self] resultAray in
            guard self != nil else { return }
            if let resultArrayDes = resultAray {
                self?.viewModel.removeAll()
                self?.viewModel = resultArrayDes
                self?.viewController?.fetchDataFromPresent()
            }
        }, failure:{ (error) in
            print(error?.localizedDescription ?? "Aqui Andres mete gamba")
        })
    }
    
    internal func showHomeTabBar() {
        self.router?.showApp(dataMenu: self.viewModel)
    }
}
