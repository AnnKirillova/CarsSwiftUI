//
//  CarDetailsDiff.swift
//  CarsSwifrUI
//
//  Created by Ann on 13.09.2021.
//

import Foundation
import UIKit

protocol CarDetailsDiffDelegate: AnyObject {
    func carDetailsDiffDidUpdateCar(_ sender: CarDetailsDiff)
}

class CarDetailsDiff: UIViewController, CarPriceDelegate, NameAndPriceCellDelegate{
    
    var car: Car?
    weak var delegate: PriceDelegate?
    weak var contentUpateDelegate: CarDetailsDiffDelegate?
    private lazy var customTableView = UITableView()
    private lazy var snapshot = NSDiffableDataSourceSnapshot<Section, CarDetailsDiffable>()
    private lazy var dataSource = setupDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTableView()
    }
    
    func setupTableView(){
        self.view.addSubview(customTableView)
        customTableView.frame = self.view.bounds
        customTableView.dataSource = dataSource
        for cell in CarDetailsDiffable.allCases{
            customTableView.register(UINib(nibName: cell.rawValue, bundle: nil), forCellReuseIdentifier: cell.rawValue)
        }
        snapshot.appendSections([Section(name: "Section")])
        snapshot.appendItems(CarDetailsDiffable.allCases)
        dataSource.apply(snapshot)
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        self.customTableView.addGestureRecognizer(tap)
    }
    
    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func setupDataSource() -> UITableViewDiffableDataSource<Section, CarDetailsDiffable>{
        return UITableViewDiffableDataSource(tableView: customTableView) { tableView, indexPath, data in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: data.rawValue, for: indexPath) as? DiffCell else {return UITableViewCell()}
            if let car = self.car{
                cell.set(car: car)
            }
            if let cell = cell as? ButtonCell{
                cell.delegate = self
            } else if let cell = cell as? NameAndPriceCell{
//                cell.priceChangeHandler = { [weak self] price in
//                    guard let self = self else { return }
//                    self.car?.price = price
//                    self.contentUpateDelegate?.carDetailsDiffDidUpdateCar(self)
//
//                    self.navigationController?.popViewController(animated: true)
//                }
                cell.delegate = self
            }
            return cell
        }
    }
    
    func changePrice() {
        self.view.endEditing(true)
    }
    
    func priceDidChanged(price: Int) {
        print("New price \(price)")
        
        car?.price = price
        contentUpateDelegate?.carDetailsDiffDidUpdateCar(self)
        
        navigationController?.popViewController(animated: true)
    }
}

struct Section: Hashable{
    let name: String
}
