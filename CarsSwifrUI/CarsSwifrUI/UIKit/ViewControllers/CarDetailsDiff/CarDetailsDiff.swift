//
//  CarDetailsDiff.swift
//  CarsSwifrUI
//
//  Created by Ann on 13.09.2021.
//

import Foundation
import UIKit

class CarDetailsDiff: UIViewController{
    
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
            switch data{
            case .carPhotoCell:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CarPhotoCell", for: indexPath)
                return cell
            case .nameAndPriceCell:
                let cell = tableView.dequeueReusableCell(withIdentifier: "NameAndPriceCell", for: indexPath)
                return cell
            case .characteristicCell:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CharacteristicCell", for: indexPath)
                return cell
            case .buttonCell:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath)
                return cell
            }
        }
    }
    
}

struct Section: Hashable{
    let name: String
}
