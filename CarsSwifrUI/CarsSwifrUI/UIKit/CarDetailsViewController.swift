//
//  CarDetailsViewController.swift
//  CarsSwifrUI
//
//  Created by Ann on 07.09.2021.
//

import UIKit

class CarDetailsViewController: UIViewController {
    var car: Car?
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var nameOfCar: UILabel!
    @IBOutlet weak var basicCost: UILabel!
    @IBOutlet weak var uanCost: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var numberOfOwner: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    func prepareView(){
        guard let car = car else {return}
        carImage.image = UIImage(named: car.icon!)
        nameOfCar.text = "\(car.mark) \(car.model) \(car.year)"
        basicCost.text = "\(car.price)$"
        uanCost.text = "/\(car.price * 28) uan"
        color.text = "Color: \(car.color)"
        numberOfOwner.text = "Number of owners: \(car.numberOfOwners)"
        self.title = "\(car.mark)"
    }
}
