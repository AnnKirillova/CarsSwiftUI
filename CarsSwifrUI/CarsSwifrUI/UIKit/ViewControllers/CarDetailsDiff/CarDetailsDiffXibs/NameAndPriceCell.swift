//
//  NameAndPriceCell.swift
//  CarsSwifrUI
//
//  Created by Ann on 13.09.2021.
//

import UIKit

protocol NameAndPriceCellDelegate: AnyObject{
    func priceDidChanged(price: Int)
}

class NameAndPriceCell: UITableViewCell, DiffCell, UITextFieldDelegate{
    
//    var priceChangeHandler: ((Int) -> Void)?
    
    @IBOutlet weak var nameAndPrice: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    var car: Car?
    weak var delegate: NameAndPriceCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        priceTextField.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func set(car: Car){
        nameAndPrice.text = "\(car.mark) \(car.model) \(car.year)"
    }
    func textFieldDidEndEditing(_ textField: UITextField){
        print("new text: \(String(describing: textField.text))")
        if let text = textField.text,
           let price = Int(text){
//            priceChangeHandler?(price)
//            priceChangeHandler = nil
            delegate?.priceDidChanged(price: price)
        }
    }
}
