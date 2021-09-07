//
//  CarViewController.swift
//  CarsSwifrUI
//
//  Created by Ann on 07.09.2021.
//

import UIKit
import SwiftUI

struct UIKitDetails: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<UIKitDetails>) -> UIViewController {
        let viewController = CarViewController()
        return viewController
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<UIKitDetails>) {
        // pass
    }
}

class CarViewController: UIViewController {
    @IBOutlet weak var tableWithCars: UITableView!
    let tableViewCell = "TableViewCell"
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCell, for: indexPath) as! TableViewCell
        cell.set(car: ModeData.shared.cars[indexPath.row])
        return cell
    }
    
    
}
