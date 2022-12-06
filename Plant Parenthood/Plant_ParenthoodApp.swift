//
//  Plant_ParenthoodApp.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 10/19/22.
//

import SwiftUI

@main
struct Plant_ParenthoodApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(PlantItemList([]))
        }
    }
}
