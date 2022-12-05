//
//  SearchView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 10/31/22.
//

import SwiftUI

struct SearchView: View {
    
    let names = ["Basil", "Fern", "Philodendron", "Snake Plant"]
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.4)
            .edgesIgnoringSafeArea(.all)
            NavigationView {
                List {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink(destination: Text(name)) {
                            Text(name)
                        }
                    }
                }
                .background(Color.green)
                .searchable(text: $searchText)
                .navigationTitle("Plant Search")
            }
        }
    }
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
