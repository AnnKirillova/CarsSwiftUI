//
//  Details.swift
//  CarsSwifrUI
//
//  Created by Ann on 06.09.2021.
//

import SwiftUI

struct Details: View {
    @State var price: String = ""
    var car: Car
    var body: some View {
        VStack {
            GeometryReader { geo  in
                Image(car.icon!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width, height: geo.size.height * 0.7, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }.frame()
            HStack {
                Text("\(car.mark) \(car.model) \(String(car.year))")
                Spacer()
            }.padding(EdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5))
            
            HStack{
                TextField("Enter price", text: $price)
                Text("/ \(car.price * 28) uah")
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
            HStack{
                
            VStack(alignment: .leading) {
                Text("Color: \(car.color)")
                Text("Number of owners: \(car.numberOfOwners)")
                Button("Change price") {
                    car.price = Int(price) ?? car.price
                }
            }
            }
        }
        .navigationTitle(car.mark)
                .navigationBarTitleDisplayMode(.inline)
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(car: ModeData.shared.cars.first!)
    }
}
