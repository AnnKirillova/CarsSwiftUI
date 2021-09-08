//
//  CarModel.swift
//  CarsSwifrUI
//
//  Created by Ann on 06.09.2021.
//

import Foundation
import SwiftUI

class Car: Identifiable, ObservableObject{
    
    var id: String = UUID().uuidString
    
    let images: [String]
    let mark: String
    let model: String
    let year: Int
    @Published var price: Int
    let fuel: Fuel
    let road: Int
    let location: String
    let transmission: Transmission
    let color: String
    let numberOfOwners: Int
    let isFavorite: Bool
    
    var icon: String? {
        return images.first
    }
    
    init(images: [String],
                  mark: String,
                  model: String,
                  year: Int,
                  price: Int,
                  fuel: Fuel,
                  road: Int,
                  location: String,
                  transmission: Transmission,
                  color: String,
                  numberOfOwners: Int,
                  isFavorite: Bool) {
        self.images = images
        self.mark = mark
        self.model = model
        self.year = year
        self.price = price
        self.fuel = fuel
        self.road = road
        self.location = location
        self.transmission = transmission
        self.color = color
        self.numberOfOwners = numberOfOwners
        self.isFavorite = isFavorite
    }
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
