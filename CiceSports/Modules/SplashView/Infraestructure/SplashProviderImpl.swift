//
//  SplashProviderImpl.swift
//  CiceSports
//
//  Created by CICE on 26/05/2021.
//

import Foundation
import Combine


protocol SplashProviderProtocol {
    func fetchMenu(completionHandler: @escaping (Result<ResponseMenuModel, NetworkingError>) -> ())
}

class SplashProviderImpl: SplashProviderProtocol {
    
    let provider: RequestManagerProtocol = RequestManager()
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchMenu(completionHandler: @escaping (Result<ResponseMenuModel, NetworkingError>) -> ()) {
        
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.baseUrl+URLEndpoint.endpointMenu)
        
        self.provider.requestGeneric(requestDTO: request, entityClass: ResponseMenuModel.self).sink {
            [weak self] (completion) in
            guard self != nil else { return }
            switch completion {
            case .finished:
                break
            case .failure(let error):
                completionHandler(.failure(error))
            }
        } receiveValue: { [weak self] responseMenuModel in
            guard self != nil else { return }
            completionHandler(.success(responseMenuModel))
                                
        }.store(in: &cancellable)
    }
    
}
