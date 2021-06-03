//
//  BodyTableViewCell.swift
//  CiceSports
//
//  Created by CICE on 31/05/2021.
//

import UIKit

protocol BodyTableViewCellDelegate: class {
    func sendInfoToVc(data: Menu)
}

protocol BodyTableViewCellProtocol {
    func configCell(data: Menu)
}

class BodyTableViewCell: UITableViewCell, ReuseIdentifierInterface {
    
    weak var delegate: BodyTableViewCellDelegate!
    var data: Menu?

    @IBOutlet weak var myImageAvatarCell: UIImageView!
    @IBOutlet weak var myNameAvatarLBL: UILabel!
    
    @IBAction func showAlert(_ sender: Any) {
        self.delegate.sendInfoToVc(data: self.data!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension BodyTableViewCell: BodyTableViewCellProtocol{
    internal func configCell(data: Menu) {
        self.data = data
        self.myNameAvatarLBL.text = data.literal
        self.myImageAvatarCell.image = showImageMenuWithName(imageMenu: data)
    }
}
