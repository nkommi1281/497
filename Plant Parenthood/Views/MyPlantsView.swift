//
//  MyPlantsView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 11/1/22.
//

import SwiftUI

struct MyPlantsView: View {

    let items = Array(1...10).map({"image\($0)"})
    
    let layout = [
        GridItem(.flexible(minimum: 75)),
        GridItem(.flexible(minimum: 75))
    ]
    
    var body: some View {
            NavigationView {
                ZStack {
                    Color.green.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    ScrollView(.vertical) {
                        LazyVGrid(columns: layout, content: {
                            ForEach(items, id: \.self) { item in
                                Image(item)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .border(Color.secondary)
                                    .cornerRadius(10)
                                    .padding()
                            }
                        })
                    }
                    .navigationTitle("My Plants")
                    .toolbar {
                        NavigationLink(destination: AddPlantView()) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height:30)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
    }
}

struct MyPlantsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlantsView()
    }
}
