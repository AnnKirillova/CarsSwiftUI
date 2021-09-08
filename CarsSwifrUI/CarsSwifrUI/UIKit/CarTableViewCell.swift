//
//  TableViewCell.swift
//  CarsSwifrUI
//
//  Created by Ann on 07.09.2021.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var titelView: NameAndPriceView!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var nameOfCar: UILabel!
    @IBOutlet weak var basicCost: UILabel!
    @IBOutlet weak var uanCost: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var fuel: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var transmission: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(car: Car){
        carImage.image = UIImage(named: car.icon!)
        speed.text = "\(car.road)"
        fuel.text = "\(car.fuel.rawValue)"
        location.text = "\(car.location)"
        transmission.text = "\(car.transmission.rawValue)"
        titelView.set(car: car)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
