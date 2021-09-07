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
            car.images.first!
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            HStack {
                Text("\(car.mark) \(car.model) \(String(car.year))")
                Spacer()
            }.padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5))
            
            HStack{
                Text("\(car.price) $")
                    .font(Font.system(size: 21))
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                Text("/ \(car.price * 28) uah")
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
            
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Image("Speed")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.red)
                            .frame(width: 25, height: 25)
                        
                        Text(" \(car.road) тис. км")
                    }
                    
                    HStack{
                        Image("fuel")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.red)
                            .frame(width: 25, height: 25)
                        
                        Text(car.fuel.rawValue)
                        
                    }
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                Spacer()
                
                VStack(alignment: .leading){
                    HStack{
                        Image("placeholder")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.red)
                            .frame(width: 25, height: 25)
                        
                        Text(" \(car.location)")
                    }
                    
                    HStack{
                        Image("manual-transmission")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.red)
                            .frame(width: 25, height: 25)
                        
                        Text(car.transmission.rawValue)
                    }
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
            }
        }
    }
}

struct CarRow_Previews: PreviewProvider {
    static var previews: some View {
        CarRow(car: ModeData.shared.cars.first!)
    }
}
