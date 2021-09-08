//
//  CarViewController.swift
//  CarsSwifrUI
//
//  Created by Ann on 07.09.2021.
//

import UIKit
import SwiftUI

class CarViewController: UIViewController {
    @IBOutlet weak var tableWithCars: UITableView!
    let tableViewCell = "CarTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    func setUpTable(){
        tableWithCars.register(UINib(nibName: tableViewCell, bundle: nil), forCellReuseIdentifier: tableViewCell)
        tableWithCars.delegate = self
        tableWithCars.dataSource = self
    }
}

extension CarViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModeData.shared.cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCell, for: indexPath) as! CarTableViewCell
        cell.set(car: ModeData.shared.cars[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CarDetailsViewController()
        vc.car = ModeData.shared.cars[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! CarTableViewCell
        vc.delegate = cell.titelView
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
