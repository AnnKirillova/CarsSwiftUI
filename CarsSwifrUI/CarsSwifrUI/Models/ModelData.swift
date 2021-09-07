//
//  ModelData.swift
//  CarsSwifrUI
//
//  Created by Ann on 06.09.2021.
//

import SwiftUI

class ModeData{
    
    static let shared = ModeData()
    private init() {}
    
    let cars: [Car] = [Car(images: ["Mercedes-1"],
                           mark: "Mercedes-Benz",
                           model: "S 400 AMB",
                           year: 2021,
                           price: 17000,
                           fuel: .benzine,
                           road: 9,
                           location: "Kyiv",
                           transmission: .auto,
                           color: "White",
                           numberOfOwners: 3,
                           isFavorite: true),
                       Car(images: ["creta"],
                           mark: "Hyndai",
                           model: "Creta",
                           year: 2020,
                           price: 15900,
                           fuel: .disel,
                           road: 7,
                           location: "Odessa",
                           transmission: .robot,
                           color: "Orange",
                           numberOfOwners: 1,
                           isFavorite: false),
                       Car(images: ["toyota"],
                           mark: "Toyota",
                           model: "Kerry",
                           year: 2018,
                           price: 14000,
                           fuel: .benzine,
                           road: 10,
                           location: "Vinnytsa",
                           transmission: .tiptonik,
                           color: "Blue",
                           numberOfOwners: 2,
                           isFavorite: false)]
}
