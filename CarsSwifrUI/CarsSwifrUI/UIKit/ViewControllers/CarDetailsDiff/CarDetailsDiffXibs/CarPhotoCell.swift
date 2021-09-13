//
//  CarPhotoCell.swift
//  CarsSwifrUI
//
//  Created by Ann on 13.09.2021.
//

import UIKit

protocol DiffCell: UITableViewCell{
    func set(car: Car)
}

class CarPhotoCell: UITableViewCell, DiffCell{

    @IBOutlet weak var carPhoto: UIImageView!
    var car: Car?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(car: Car){
        carPhoto.image = UIImage(named: car.icon!)
    }
}
