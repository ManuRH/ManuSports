//
//  LocalizedKeys.swift
//  CiceSports
//
//  Created by CICE on 01/06/2021.
//

import Foundation

struct LocalizedKeys {
    //General
    struct General {
        static let titleAlertDefault = "title_my_alert".localized
        static let messaAlertDefault = "message_my_alert".localized
        static let primaryButtonAlertDefault = "general_accept".localized
        static let secundaryButtonAlertDefault = "general_cancel".localized
    }
    // Default Alert
    // Mail
    // Login
    
}

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
