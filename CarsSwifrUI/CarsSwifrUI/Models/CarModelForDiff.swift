//
//  CarModelForDiff.swift
//  CarsSwifrUI
//
//  Created by Ann on 13.09.2021.
//

import Foundation

enum CarDetailsDiffable: String, CaseIterable, Hashable{
    case carPhotoCell = "CarPhotoCell"
    case nameAndPriceCell = "NameAndPriceCell"
    case characteristicCell = "CharacteristicCell"
    case buttonCell = "ButtonCell"
}
