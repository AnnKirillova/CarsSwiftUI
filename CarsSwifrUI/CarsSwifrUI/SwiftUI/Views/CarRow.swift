//
//  CarRow.swift
//  CarsSwifrUI
//
//  Created by Ann on 06.09.2021.
//

import SwiftUI

struct CarRow: View {
    let car: Car
    var body: some View {
        VStack {
            Image(car.icon!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200, alignment: .leading)
            
            HStack {
                Text("\(car.mark) \(car.model) \(String(car.year))")
                Spacer()
            }
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5))
            
            HStack{
                Text("\(car.price) $")
                    .font(Font.system(size: 21))
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                Text("/ \(car.price * 28) uah")
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
            
            HStack{
                VStack(alignment: .leading){
                    CarCharacteristicView(imageName: "Speed",text: " \(car.road) тис. км")
                    CarCharacteristicView(imageName: "fuel", text: car.fuel.rawValue)
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Spacer()
                
                VStack(alignment: .leading){
                    CarCharacteristicView(imageName: "placeholder", text: " \(car.location)")
                    CarCharacteristicView(imageName: "manual-transmission", text: car.transmission.rawValue)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
            }
        }
    }
}

struct CarCharacteristicView: View {
    var imageName: String
    var text: String
    
    var body: some View {
        HStack{
            Image(imageName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.red)
                .frame(width: 25, height: 25)
            
            Text(" \(text)")
        }
    }
}

struct CarRow_Previews: PreviewProvider {
    static var previews: some View {
        CarRow(car: ModeData.shared.cars.first!)
    }
}
