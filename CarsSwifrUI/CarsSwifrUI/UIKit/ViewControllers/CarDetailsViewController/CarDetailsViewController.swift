//
//  CarDetailsViewController.swift
//  CarsSwifrUI
//
//  Created by Ann on 07.09.2021.
//

import UIKit

protocol PriceDelegate: AnyObject{
    func addPrice(newPrice: String)
}

class CarDetailsViewController: UIViewController {
    var car: Car?
    weak var delegate: PriceDelegate?
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var nameOfCar: UILabel!
    @IBOutlet weak var basicCost: UITextField!
    
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
        color.text = "Color: \(car.color)"
        numberOfOwner.text = "Number of owners: \(car.numberOfOwners)"
        self.title = "\(car.mark)"
    }
    
    @IBAction func priceActionButton(_ sender: UIButton) {
        let newPrice = basicCost.text
        delegate?.addPrice(newPrice: newPrice ?? "Error")
        navigationController?.popViewController(animated: true)
    }
}
