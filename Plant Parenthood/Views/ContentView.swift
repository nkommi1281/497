//
//  ContentView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 10/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Plant Parenthood"
    var body: some View {
        TabView {
            HomeView()
                .font(.title)
                .fontWeight(.bold)
                .tabItem {
                    Image(systemName: "house")
                    Text("My Plants")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.brown, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Plant Search")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.brown, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
            ScheduleView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Schedule")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.brown, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
            //WishListView()
            Text("Wishlist")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Wishlist")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.brown, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
