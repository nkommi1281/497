//
//  PlantItem.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 12/5/22.
//

import Foundation

struct Task: Hashable {
    var name: String
    var frequency: String
    var days: [String]
    
    init(namevar: String, freqvar: String, daysvar: [String]) {
        name = namevar
        frequency = freqvar
        days = daysvar
    }
}

struct PlantItem: Hashable {
    var plantItemName: String
    var plantItemSpecies: String
    var plantItemImageName: String
    var plantItemURL: String
    var tasks: [Task]
    
    init(name: String, species: String, imageName: String, url: String) {
        plantItemName = name
        plantItemSpecies = species
        plantItemImageName = imageName
        plantItemURL = url
        tasks = []
    }
    
    mutating func addTask (task: Task) {
        tasks.append(task)
    }
    
    public func getTasks() -> [Task] {
        return tasks
    }
    
}
