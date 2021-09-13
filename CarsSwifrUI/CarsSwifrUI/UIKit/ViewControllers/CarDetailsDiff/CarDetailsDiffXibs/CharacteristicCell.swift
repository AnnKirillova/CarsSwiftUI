//
//  CharacteristicCell.swift
//  CarsSwifrUI
//
//  Created by Ann on 13.09.2021.
//

import UIKit

class CharacteristicCell: UITableViewCell, DiffCell{

    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var numOfOwners: UILabel!
    var car: Car?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(car: Car){
        color.text = "\(car.color)"
        numOfOwners.text = "\(car.numberOfOwners)"
    }
}
