// MenuPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MenuPresenterProtocol {
    func getNumberOfRowInSections() -> Int
    func getInformationObject(indexPath: Int) -> Menu?
    func showWebSiteGoogle()
    func fetchDataFromHeroku()
    func navigateToMusic()
    func navigateToCalendar()
    func navigateToConsejos()
}

class MenuPresenterImpl: BasePresenter<MenuViewControllerProtocol, MenuRouterProtocol> {
    
    var interactor: MenuInteractorProtocol?
    var dataMenu: [MenuResponse] = []
    var dataConsejos: [ConsejosGenerale] = []
    
    internal func getNumberOfRowInSections() -> Int {
        self.dataMenu.count
    }
        
    internal func getInformationObject(indexPath: Int) -> Menu? {
        self.dataMenu[indexPath].menu
    }
}


extension MenuPresenterImpl: MenuPresenterProtocol {
    
    func showWebSiteGoogle() {
        self.router?.showDefaultAlert(delegate: self, model: AlertDefaultViewModel(type: .confirmationNavigation))
    }
    
    func fetchDataFromHeroku() {
        self.interactor?.fetchDataFromHerokuBusiness(success: { [weak self](result) in
            guard self != nil else { return }
            guard let resultDes = result else { return }
            self?.dataConsejos.removeAll()
            self?.dataConsejos = resultDes
            
        }, failure: { (error) in
            print(error?.localizedDescription ?? "o lo que sea vamos Error")
            
        })
    }
    
    func navigateToMusic() {
        // TODO: 
    }
    
    func navigateToCalendar() {
        //
    }
    
    func navigateToConsejos() {
        self.router?.navigateToConsejosRouter(data: self.dataConsejos)
    }
}

extension MenuPresenterImpl: AlertDefaultViewControllerDelegate {
    func defaultPrimaryButtonPreesed(type: DefaultAlertType) {
        self.router?.showWebSiteInRouter()
    }
}
