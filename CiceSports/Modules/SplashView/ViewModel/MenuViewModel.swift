//
//  MenuViewModel.swift
//  CiceSports
//
//  Created by CICE on 26/05/2021.
//

import Foundation

struct  MenuViewModel {
    let menuResponse: [MenuResponse]?
    
    init(businessModel: ResponseMenuModel) {
        self.menuResponse = businessModel.menuResponse
    }
}
