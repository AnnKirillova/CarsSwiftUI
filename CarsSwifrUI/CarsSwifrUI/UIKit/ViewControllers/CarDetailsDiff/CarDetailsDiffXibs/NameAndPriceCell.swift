//
//  NameAndPriceCell.swift
//  CarsSwifrUI
//
//  Created by Ann on 13.09.2021.
//

import UIKit

class NameAndPriceCell: UITableViewCell, DiffCell, UITextFieldDelegate{
    
    @IBOutlet weak var nameAndPrice: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    var car: Car?
    
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
    }
}
