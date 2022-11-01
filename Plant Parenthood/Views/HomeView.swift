//
//  HomeView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 10/31/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
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
                        NavigationLink(destination: MyPlantsView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.green)
                                    .frame(width: 120, height: 200)
                                Image("home-1")
                                    .resizable()
                                    .frame(width: 150, height: 250)
                                    .scaledToFit()
                                    .cornerRadius(25)
                                    .aspectRatio(contentMode: .fit)
                                Text("My Plants")
                                    .foregroundColor(.black)
                                    .tint(.white)
                                    .fontWeight(.bold)
                                    .buttonStyle(.bordered)
                                    .controlSize(.large)
//                                    .padding(.trailing, 10)
                            }
                        }
                        NavigationLink(destination: SearchView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.green)
                                    .frame(width: 120, height: 200)
                                Image("home-2")
                                    .resizable()
                                    .frame(width: 150, height: 250)
                                    .scaledToFit()
                                    .cornerRadius(25)
                                    .aspectRatio(contentMode: .fit)
                                Text("Search")
                                    .foregroundColor(.black)
                                    .tint(.white)
                                    .buttonStyle(.bordered)
                                    .controlSize(.large)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    NavigationLink(destination: ScheduleView()) {
                        ZStack {
                            Image("home-3")
                                .resizable()
                                .frame(width: 300, height: 125)
                                .scaledToFit()
                                .cornerRadius(25)
                                .aspectRatio(contentMode: .fit)
                            Text("Calendar")
                                .foregroundColor(.black)
                                .tint(.white)
                                .buttonStyle(.bordered)
                                .controlSize(.large)
                                .fontWeight(.bold
                                )
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
