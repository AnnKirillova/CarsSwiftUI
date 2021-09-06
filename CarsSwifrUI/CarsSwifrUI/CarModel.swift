//
//  CarModel.swift
//  CarsSwifrUI
//
//  Created by Ann on 06.09.2021.
//

import Foundation
import SwiftUI

struct Car: Identifiable{
    var id: String = UUID().uuidString
    
    let images: [Image]
    let mark: String
    let model: String
    let year: Int
    let price: Int
    let fuel: Fuel
    let road: Int
    let location: String
    let transmission: Transmission
    let color: String
    let numberOfOwners: Int
}

enum Fuel: String {
    case disel
    case benzine
    case gas
    case electro
}

enum Transmission: String{
    case manual
    case auto
    case robot
    case tiptonik
    case variator
}
