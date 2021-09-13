//
//  NameAndPriceCell.swift
//  CarsSwifrUI
//
//  Created by Ann on 13.09.2021.
//

import UIKit

class NameAndPriceCell: UITableViewCell{

    @IBOutlet weak var nameAndPrice: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    var car: Car?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
