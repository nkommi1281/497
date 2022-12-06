//
//  PlantProfileView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 12/5/22.
//

import SwiftUI

struct PlantProfileView: View {
    @EnvironmentObject var thePlantItemList: PlantItemList
    @State var showModal: Bool = false
    @State var showModal2: Bool = false
    var plantItem: PlantItem
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical) {
                    VStack {
                        let image = getImageFromDir(plantItem.plantItemURL)
                        let name = plantItem.plantItemName
                        Text(name).font(.system(size: 37)).fontWeight(.bold).padding()
                        if image != nil {
                            Image(uiImage: image!)
                                .resizable()
                                .frame(width: 300, height: 300)
                                .background(Color.black.opacity(0.2))
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .padding(8)
                                .rotationEffect(.degrees(90))
                        }
                        HStack {
                            Text("Plant Species: \(plantItem.plantItemSpecies)").font(.headline).fontWeight(.bold).padding()
                            Spacer()
                        }
                        HStack {
                            Text("Tasks for \(plantItem.plantItemName):").font(.system(size: 22)).fontWeight(.bold).padding()
                            Spacer()
                            Text("Add New")
                                .font(.body)
                                .frame(maxWidth:110)
                                .frame(height: 35)
                                .background(Color.black)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding()
                                .onTapGesture {
                                    self.showModal2.toggle()
                                }
                        }
                        Spacer()
                    }
                }
                if showModal2 {
                    Rectangle() // the semi-transparent overlay
                        .foregroundColor(Color.black.opacity(0.5))
                        .edgesIgnoringSafeArea(.all)

                    GeometryReader { geometry in // the modal container
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .overlay(AddTaskView(showModal2: self.$showModal2))
                    }
                    .transition(.move(edge: .bottom))
                }
            }
        }
        .toolbar {
            Button(action: {thePlantItemList.removePlantItem(trashPlantItem: plantItem)}) {
                Image(systemName: "trash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height:30)
                    .foregroundColor(.black)
            }
        }
        .navigationTitle(plantItem.plantItemName).font(.system(size: 50))
        .navigationBarTitleDisplayMode(.inline)


    }
}

//struct PlantProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlantProfileView()
//    }
//}
