//
//  Modified.swift
//  CarsSwifrUI
//
//  Created by Oleksii Kolomiiets on 24.09.2021.
//

import Foundation

@propertyWrapper
struct Modified {
    
    enum ModificationType {
        case capitalised
        case uppercased
    }
    
    var modificationType: ModificationType
    
    var wrappedValue: String = "" {
        didSet {
            switch modificationType {
            case .capitalised:
                self.wrappedValue = wrappedValue.capitalized
            case .uppercased:
                wrappedValue = wrappedValue.uppercased()
            }
        }
    }
    
    init(wrappedValue: String, _ modificationType: ModificationType) {
        self.modificationType = modificationType
        
        switch modificationType {
        case .capitalised:
            self.wrappedValue = wrappedValue.capitalized
        case .uppercased:
            self.wrappedValue = wrappedValue.uppercased()
        }
    }
    
//    private mutating func modify(using modificationType: ModificationType) {
//        switch modificationType {
//        case .capitalised:
//            self.wrappedValue = wrappedValue.capitalized
//        case .uppercased:
//            self.wrappedValue = wrappedValue.uppercased()
//        }
//    }
}
