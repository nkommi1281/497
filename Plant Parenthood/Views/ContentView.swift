//
//  ContentView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 10/19/22.
//

import SwiftUI

enum Tab {
    case home
    case plants
    case schedule
    case search
}

class TabController: ObservableObject {
    @Published var activeTab = Tab.home

    func open(_ tab: Tab) {
        activeTab = tab
    }
}

struct ContentView: View {
    @StateObject private var tabController = TabController()
    @EnvironmentObject var thePlantItemList: PlantItemList
    var body: some View {
        TabView(selection: $tabController.activeTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .font(.title)
                .fontWeight(.bold)
                .tag(Tab.home)
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.brown.opacity(0.4), for: .tabBar)
                //.toolbarColorScheme(.light, for: .tabBar)
            MyPlantsView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("My Plants")
                }
                .tag(Tab.plants)
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.brown.opacity(0.4), for: .tabBar)
                //.toolbarColorScheme(.light, for: .tabBar)
            ScheduleView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Schedule")
                }
                .tag(Tab.schedule)
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.brown.opacity(0.4), for: .tabBar)
                //.toolbarColorScheme(.light, for: .tabBar)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Plant Search")
                }
                .tag(Tab.search)
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.brown.opacity(0.4), for: .tabBar)
                //.toolbarColorScheme(.light, for: .tabBar)
        }
        .environmentObject(tabController)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
