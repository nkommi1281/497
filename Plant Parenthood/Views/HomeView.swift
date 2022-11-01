//
//  HomeView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 10/31/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.green.opacity(0.4)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Plant Parenthood")
                    .font(.system(size: 37))
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                    .padding(.top, 100)
                Text("Welcome")
                    .italic()
                    .font(.system(size: 27))
                    .fontWeight(.bold)
                    .padding(.bottom, 90)
                HStack {
                    NavigationLink(destination: SearchView()) {
                        Button("My Plants") {}
                            .foregroundColor(.black)
                            .tint(.white)
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                            .padding(.trailing, 10)
                    }
                    NavigationLink(destination: SearchView()) {
                        Button("Search") {}
                            .foregroundColor(.black)
                            .tint(.white)
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                            .padding(.leading, 10)
                    }
                }
                NavigationLink(destination: ScheduleView()) {
                    Button("Calendar") {}
                        .foregroundColor(.black)
                        .tint(.white)
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                        .padding(.top, 10)
                }
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
