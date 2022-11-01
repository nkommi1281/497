//
//  HomeView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 10/31/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Plant Parenthood")
                .font(.title)
                .fontWeight(.bold)
            Text("Welcome!")
                .font(.headline)

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
