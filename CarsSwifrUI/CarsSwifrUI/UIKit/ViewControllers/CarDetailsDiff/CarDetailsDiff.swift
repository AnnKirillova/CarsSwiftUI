//
//  CarDetailsDiff.swift
//  CarsSwifrUI
//
//  Created by Ann on 13.09.2021.
//

import Foundation
import UIKit

class CarDetailsDiff: UIViewController, CarPriceDelegate{
    
    var car: Car?
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
    }
    
    func setupDataSource() -> UITableViewDiffableDataSource<Section, CarDetailsDiffable>{
        return UITableViewDiffableDataSource(tableView: customTableView) { tableView, indexPath, data in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: data.rawValue, for: indexPath) as? DiffCell else {return UITableViewCell()}
            if let car = self.car{
                cell.set(car: car)
            }
            if let cell = cell as? ButtonCell{
                cell.delegate = self
            }
            return cell
        }
    }
    func changePrice() {
        self.view.endEditing(true)
    }
}

struct Section: Hashable{
    let name: String
}
