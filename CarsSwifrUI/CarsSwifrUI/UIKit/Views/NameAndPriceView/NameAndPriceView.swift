//
//  NameAndPriceView.swift
//  CarsSwifrUI
//
//  Created by Ann on 08.09.2021.
//

import UIKit

class NameAndPriceView: UIView, PriceDelegate, CarPriceDelegate {
    
    @IBOutlet weak var nameOfCar: UILabel!
    @IBOutlet weak var basicPrice: UILabel!
    @IBOutlet weak var priceInUan: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("NameAndPriceView", owner:self, options: nil)! [0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    
    func set(car: Car){
        nameOfCar.text = car.mark + car.model + "\(car.year)"
        basicPrice.text = "\(car.price)$"
        priceInUan.text = "/\(car.price * 28) uan"
    }
    
    func addPrice(newPrice: String) {
        basicPrice.text = newPrice + "$"
        priceInUan.text = "\((Int(newPrice) ?? 0) * 28) uan"
    }
    
    func changePrice() {
//        basicPrice.text =  + "$"
//        priceInUan.text = "\((Int(newPrice) ?? 0) * 28) uan"
    }
}
