//
//  CCC.swift
//  CiceSports
//
//  Created by CICE on 26/05/2021.
//

import Foundation


protocol SplashInteractorProtocol {
    func fetchDataFromHerokuBusiness(success: @escaping([MenuResponse]?) -> (), failure: @escaping(NetworkingError?) -> ())
    
}

class SplashInteractorImpl: BaseInteractor<SplashPresenterProtocol> {
    
    var provider: SplashProviderProtocol = SplashProviderImpl()
    
}

extension SplashInteractorImpl: SplashInteractorProtocol{
    
    internal func fetchDataFromHerokuBusiness(success: @escaping([MenuResponse]?) -> (), failure: @escaping(NetworkingError?) -> ()){
        CoreDataStack.shared.isFirstTime { (result) in
            if result {
                CoreDataStack.shared.setValueFirstTime(value: false)
                self.provider.fetchMenu{ [weak self] (result) in
                    guard self != nil else { return }
                    switch result{
                    case .success(let response):
                        CoreDataStack.shared.setMenu(data: response.menuResponse ?? [])
                        success(CoreDataStack.shared.getMenu())
                    case .failure(let error):
                        failure(error)
                    }
                }
            } else {
                CoreDataStack.shared.loadDataIfNeeded { (isRefreshingRequired) in
                    if isRefreshingRequired {
                        self.provider.fetchMenu{ [weak self] (result) in
                            guard self != nil else { return }
                            switch result{
                            case .success(let response):
                                CoreDataStack.shared.setMenu(data: response.menuResponse ?? [])
                                success(CoreDataStack.shared.getMenu())
                            case .failure(let error):
                                failure(error)
                            }
                        }
                        
                    } else  {
                        success(CoreDataStack.shared.getMenu())
                    }
                }
            }
        }
    }
}
