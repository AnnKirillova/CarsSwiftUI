//
//  SearchView.swift
//  CarsSwifrUI
//
//  Created by Ann on 06.09.2021.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView{
            NavigationLink(
                destination: ContentView(),
                label: {
                    Text("Search")
                })
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
