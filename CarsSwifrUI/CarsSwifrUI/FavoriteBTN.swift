//
//  FavoriteBTN.swift
//  CarsSwifrUI
//
//  Created by Ann on 06.09.2021.
//

import SwiftUI

struct FavoriteBTN: View {
    @Binding var isSet: Bool
    var body: some View {
        Button(action: {
            isSet.toggle()
        }){
            Image(systemName: isSet ? "star.fill": "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}

struct FavoriteBTN_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteBTN(isSet: .constant(true))
    }
}
