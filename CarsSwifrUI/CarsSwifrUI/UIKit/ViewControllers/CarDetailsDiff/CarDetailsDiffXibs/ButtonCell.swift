//
//  ButtonCell.swift
//  CarsSwifrUI
//
//  Created by Ann on 13.09.2021.
//

import UIKit

protocol CarPriceDelegate: AnyObject{
    func changePrice()
}

class ButtonCell: UITableViewCell, DiffCell{
    weak var delegate: CarPriceDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func changePriceActionButton(_ sender: UIButton) {
        delegate?.changePrice()
    }
    
    func set(car: Car) {
    }
}
