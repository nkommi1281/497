//
//  MyPlantsView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 11/1/22.
//

import SwiftUI

struct MyPlantsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                VStack() {
                    HStack() {
                        Text("My Plants")
                            .font(.system(size: 37))
                            .fontWeight(.bold)
                            .padding(.top, 30)
                        NavigationLink(destination: AddPlantView()) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height:30)
                                .padding(.top, 30)
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()
                    HStack() {
                        
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
