//
//  SearchView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 10/31/22.
//

import SwiftUI

struct SearchItem: Hashable {
    var species: String
    var difficulty: Int
    var lightLevel: String
    var waterFreq: String
    
    init(speciesvar: String, difficultyvar: Int, lightLevelVar: String, waterFreqVar: String) {
        species = speciesvar
        difficulty = difficultyvar
        lightLevel = lightLevelVar
        waterFreq = waterFreqVar
    }
}

class SearchItemList: ObservableObject {
    
    @Published var itemList: [SearchItem]
    
    init(_ itemList: [SearchItem]) {
        self.itemList = itemList
        let names = ["Adiantum Fern", "Aechmea Bromeliad", "Aeschynanthus", "Aglaonema", "Aglaonema Maria", "Aglaonema Silver Bay",
                     "Adiantum Silver Queen", "Anthurium", "Aphelandra", "Arboricola", "Aspidistra", "Asplenium Nidus", "Birds Nest Fern", "Boston Fern", "Hoya", "Peace Lily", "Pothos", "Monstera Adonsonii", "Sansevieria"]
        for i in 0..<names.count {
            self.itemList.append(SearchItem(speciesvar: names[i], difficultyvar: Int.random(in: 0..<5), lightLevelVar: "", waterFreqVar: ""))
        }
        self.itemList.append(SearchItem(speciesvar: "Philodendron Xanadu", difficultyvar: 2, lightLevelVar: "Medium - Bright", waterFreqVar: "Weekly"))
    }
    
    public func addSearchItem (newSearchItem: SearchItem) {
        itemList.append(newSearchItem)
    }
    
    public func getSearchItemList() -> [SearchItem] {
        return itemList
    }
    
}



struct SearchView: View {
    @ObservedObject var theSearchItemList = SearchItemList([])
    let names = ["Adiantum Fern", "Aechmea Bromeliad", "Aeschynanthus", "Aglaonema", "Aglaonema Maria", "Aglaonema Silver Bay",
                 "Adiantum Silver Queen", "Anthurium", "Aphelandra", "Arboricola", "Aspidistra", "Asplenium Nidus", "Birds Nest Fern", "Boston Fern", "Hoya", "Peace Lily", "Philodendron Xanadu", "Pothos", "Monstera Adonsonii", "Sansevieria"]
    
    @State private var searchText = ""
    
    var body: some View {
            NavigationView {
                List {
                    ForEach(searchResults, id: \.self) { name in
                        NavigationLink(destination: SearchResultView(searchItem: theSearchItemList.getSearchItemList().first(where: {$0.species == name})!)) {
                            Text(name)
                        }
                    }
                }
                .background(Color.green)
                .searchable(text: $searchText)
                .navigationTitle("Plant Search")
            }
    }
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter{ $0.contains(searchText) }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


