//
//  PlantItemList.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 12/5/22.
//

import Foundation

class PlantItemList: ObservableObject {
    
    @Published var itemList: [PlantItem]
    
    init(_ itemList: [PlantItem]) {
        self.itemList = itemList
    }
    
    public func addPlantItem (newPlantItem: PlantItem) {
        itemList.append(newPlantItem)
    }
    
    public func getPlantItemList() -> [PlantItem] {
        return itemList
    }
    
    public func removePlantItem (trashPlantItem: PlantItem) {
        itemList.removeAll(where: {$0.plantItemName == trashPlantItem.plantItemName})
    }
    
}
