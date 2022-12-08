//
//  SearchResultView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 12/7/22.
//

import SwiftUI

struct SearchResultView: View {
    var searchItem: SearchItem
    var body: some View {
        ZStack {
            Color.green.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical) {
                VStack {
                    //Spacer()
                    HStack {
                        Text(searchItem.species).font(.title).fontWeight(.bold).padding()
                        Spacer()
                    }
                    AsyncImage(url: URL(string: "https://media.istockphoto.com/id/1330895394/photo/philodendron-xanadu-xanadu-leaves-isolated-on-white-background-with-clipping-path.jpg?s=612x612&w=0&k=20&c=jAlOJxFLkJQHJcvxNfCCq5du6vM5RJ-ni9fm42bV7yo=")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 250, height: 250)
                    //.border(Color.white.opacity(0.5), width: 5)
                    .shadow(radius: 10)
                    .cornerRadius(30)
                    .padding(.bottom, 20)
                    Spacer()
                    ZStack {
                        Spacer()
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 375, height: 275)
                            .foregroundColor(.white.opacity(0.5))
                        VStack {
                            HStack {
                                Text("Difficulty: ").font(.headline).fontWeight(.bold).padding()
                                ForEach(0..<5) { i in
                                    if i <= searchItem.difficulty - 1 {
                                        Image(systemName: "star.fill").foregroundColor(.orange)
                                    }
                                    else {
                                        Image(systemName: "star").foregroundColor(.orange)
                                    }
                                }
                                Spacer()
                            }.padding(.top, 20)
                            HStack {
                                Text("Light Preferences: \(searchItem.lightLevel)").font(.headline).fontWeight(.bold).padding()
                                Spacer()
                            }.padding(.top, 20)
                            HStack {
                                Text("Watering Frequency: \(searchItem.waterFreq)").font(.headline).fontWeight(.bold).padding()
                                Spacer()
                            }.padding(.top, 20)
                            Spacer()
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

//struct SearchResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultView()
//    }
//}
