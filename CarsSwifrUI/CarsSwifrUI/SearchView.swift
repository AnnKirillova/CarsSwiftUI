//
//  SearchView.swift
//  CarsSwifrUI
//
//  Created by Ann on 06.09.2021.
//

import SwiftUI

struct SearchView: View {

    init() {
        let coloredAppearance = UINavigationBarAppearance()
          coloredAppearance.configureWithOpaqueBackground()
          coloredAppearance.backgroundColor = .systemRed
          coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
          coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

          UINavigationBar.appearance().standardAppearance = coloredAppearance
          UINavigationBar.appearance().compactAppearance = coloredAppearance
          UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance

          UINavigationBar.appearance().tintColor = .white
        }
    
    var body: some View {
        NavigationView{
            NavigationLink(
                destination: ContentView(),
                label: {
                    Text("Search SwiftUI")
                })
                .navigationBarTitle(Text("SEARCH"), displayMode: .inline)
            NavigationLink(
                destination: ContentView(),
                label: {
                    Text("Search UIKit")
                })
                .navigationBarTitle(Text("SEARCH"), displayMode: .inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
