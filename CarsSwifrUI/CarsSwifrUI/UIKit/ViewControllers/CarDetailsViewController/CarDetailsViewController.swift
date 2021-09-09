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
    @IBOutlet weak var scrollViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentScrollView: UIScrollView!
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
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        self.contentScrollView.addGestureRecognizer(tap)
    }
    
    @IBAction func priceActionButton(_ sender: UIButton) {
        let newPrice = basicCost.text
        delegate?.addPrice(newPrice: newPrice ?? "Error")
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShowNotification(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHideNotification(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    
    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        scrollViewTopConstraint.constant = 0
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc
    func keyboardWillShowNotification(_ notification: NSNotification) {
        let viewHeignt = self.view.bounds.height
        let textFieldFrame = contentScrollView.convert(basicCost.frame, to: self.view)
        let yTextField = textFieldFrame.origin.y
        let textFieldHeight = textFieldFrame.size.height
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let yKeyboard = viewHeignt - keyboardHeight
            let delta = yKeyboard - (yTextField + textFieldHeight)
            if delta < 0{
                scrollViewTopConstraint.constant = delta
            }
            
        }
    }
    
    @objc
    func keyboardWillHideNotification(_ notification: NSNotification) {
    }
}
