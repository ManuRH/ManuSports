// MenuInteractor.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MenuInteractorProtocol {
    func fetchDataFromHerokuBusiness(success: @escaping([ConsejosGenerale]?) -> (), failure: @escaping(NetworkingError?) -> ())
    
}

class MenuInteractorImpl: BaseInteractor<MenuPresenterProtocol> {
    
    var provider: MenuProviderProtocol = MenuProviderImpl()
    
}

extension MenuInteractorImpl: MenuInteractorProtocol {
    func fetchDataFromHerokuBusiness(success: @escaping ([ConsejosGenerale]?) -> (), failure: @escaping (NetworkingError?) -> ()) {
        CoreDataStack.shared.isFirstTime { (result) in
            if result {
                CoreDataStack.shared.setValueFirstTime(value: false)
                self.transformDatasuccess(success: success, failure: failure)
            } else {
                CoreDataStack.shared.loadDataIfNeeded { (isRefreshingRequired) in
                    if isRefreshingRequired {
                        self.transformDatasuccess(success: success, failure: failure)
                    } else  {
                        success(CoreDataStack.shared.getConsejos())
                    }
                }
            }
        }
    }
    
    private func transformDatasuccess(success: @escaping ([ConsejosGenerale]?) -> (), failure: @escaping (NetworkingError?) -> ()) {
        self.provider.fetchConsejos{ [ weak self ](result) in
            guard self != nil else { return }
            switch result{
            case .success(let response):
                CoreDataStack.shared.setConsejos(data: response.icoResponseConsejos?.consejosGenerales ?? [])
                success(CoreDataStack.shared.getConsejos())
            case .failure(let error):
                failure(error)
            }
        }
    }
}


