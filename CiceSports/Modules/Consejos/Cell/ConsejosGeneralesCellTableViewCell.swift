//
//  ConsejosGeneralesCellTableViewCell.swift
//  CiceSports
//
//  Created by CICE on 02/06/2021.
//

import UIKit

class ConsejosGeneralesCellTableViewCell: BaseTableViewCell<ConsejosGenerale>, ReuseIdentifierInterface {

    var model: ConsejosGenerale?
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myNameConsejosLBL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func configured(cellModel: ConsejosGenerale) {
        self.myNameConsejosLBL.text = cellModel.title!
    }
}
