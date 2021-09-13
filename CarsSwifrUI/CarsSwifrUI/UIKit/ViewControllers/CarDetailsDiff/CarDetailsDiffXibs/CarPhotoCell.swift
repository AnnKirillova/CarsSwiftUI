//
//  CarPhotoCell.swift
//  CarsSwifrUI
//
//  Created by Ann on 13.09.2021.
//

import UIKit

class CarPhotoCell: UITableViewCell{

    @IBOutlet weak var carPhoto: UIImageView!
    var car: Car?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
