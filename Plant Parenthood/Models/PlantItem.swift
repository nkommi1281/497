//
//  PlantItem.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 12/5/22.
//

import Foundation

struct PlantItem: Hashable {
    var plantItemName: String
    var plantItemSpecies: String
    var plantItemImageName: String
    var plantItemURL: String
    
//    var plantItemImage: Image {
//        Image(plantItemImageName)
//    }
    
    init(name: String, species: String, imageName: String, url: String) {
        plantItemName = name
        plantItemSpecies = species
        plantItemImageName = imageName
        plantItemURL = url
    }
    
}
