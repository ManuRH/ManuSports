//
//  ConsejosGeneralesDrawer.swift
//  CiceSports
//
//  Created by CICE on 03/06/2021.
//

import Foundation
import UIKit

class ConsejosGeneralesDrawer {
    static func cell(model: ConsejosGenerale, tableView: UITableView, presenter: Any?) -> UITableViewCell {
        guard let cell = BaseTableViewCell<Any>.createBaseCell(tableView: tableView, cell: ConsejosGeneralesCellTableViewCell.self, cellName: ConsejosGeneralesCellTableViewCell.defaultReuseIdentifier, model: model) else {
            return UITableViewCell()
        }
        return cell
    }
}
