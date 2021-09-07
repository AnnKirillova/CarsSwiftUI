//
//  ContentView.swift
//  CarsSwifrUI
//
//  Created by Ann on 06.09.2021.
//

import SwiftUI

struct ContentView: View {
    let cars: [Car] = ModeData.shared.cars
    
    var body: some View {
        List {
            ForEach(cars) { car in
                NavigationLink(destination: Details(car: car)) {
                    CarRow(car: car)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
