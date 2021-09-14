//
//  CarViewController.swift
//  CarsSwifrUI
//
//  Created by Ann on 07.09.2021.
//

import UIKit

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
        if ModeData.shared.cars.indices.contains(indexPath.row) {
            cell.set(car: ModeData.shared.cars[indexPath.row])
        }
        // go to server -- fetch image...
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CarTableViewCell
        if indexPath.row == 0{
            let vc = CarDetailsDiff()
            vc.contentUpateDelegate = self
            vc.car = ModeData.shared.cars[indexPath.row]
            vc.delegate = cell.titelView
            self.navigationController?.pushViewController(vc, animated: true)
        } else{
            let vc = CarDetailsViewController()
            vc.car = ModeData.shared.cars[indexPath.row]
            vc.delegate = cell.titelView
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension CarViewController: CarDetailsDiffDelegate {
    func carDetailsDiffDidUpdateCar(_ sender: CarDetailsDiff) {
        guard let car = sender.car else {
            return
        }
        
        let carId = car.id
        
        var idx: Int = 0
        
        for (index, storedCar) in ModeData.shared.cars.enumerated() where car.id == storedCar.id {
            idx = index
            break
        }
        
        let indexPath = IndexPath(row: idx, section: 0)
        let cellByIndexPath = tableWithCars.cellForRow(at: indexPath) as? CarTableViewCell
        
        cellByIndexPath?.titelView.set(car: car)
    }
}
