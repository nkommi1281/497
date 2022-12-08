//
//  MyPlantsView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 11/1/22.
//

import SwiftUI

struct MyPlantsView: View {
    @State var showModal: Bool = false
    @EnvironmentObject var thePlantItemList: PlantItemList
    
    let layout = [
        GridItem(.flexible(minimum: 75)),
        GridItem(.flexible(minimum: 75))
    ]
    
    
    var body: some View {
            NavigationView {
                ZStack {
                    Color.green.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    if thePlantItemList.getPlantItemList().isEmpty {
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white.opacity(0.5))
                                    .frame(width: 370, height: 120)
                                    .padding(.top, 100)
                                Text("You haven't added any plants yet! Tap the plus icon above to add your first plant.")
                                    .font(.system(size: 20))
                                    //.fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black.opacity(0.5))
                                    .padding(.top, 100)
                                    .padding()
                            }
                            Spacer()
                        }
                        .toolbar {
                            Button(action: {self.showModal.toggle()}) {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height:30)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    else {
                        ScrollView(.vertical) {
                            LazyVGrid(columns: layout, content: {
                                ForEach(thePlantItemList.getPlantItemList(), id: \.self) { item in
                                    NavigationLink(destination: PlantProfileView(plantItem: item)) {
                                        VStack {
                                            let image = getImageFromDir(item.plantItemURL)
                                            let name = item.plantItemName
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                                    .fill(.black).opacity(0.2)
                                                    .frame(width: 150, height: 150)
                                                if image != nil {
                                                    Image(uiImage: image!)
                                                        .resizable()
                                                        .frame(width: 100, height: 100)
                                                        .background(Color.black.opacity(0.2))
                                                        .aspectRatio(contentMode: .fit)
                                                        .clipShape(Circle())
                                                        .padding(8)
                                                        .rotationEffect(.degrees(90))
                                                }
                                            }
                                            Text(name).font(.headline).fontWeight(.bold).foregroundColor(.black)
                                        }
                                    }
                                }
                            })
                        }
                        .toolbar {
                            Button(action: {self.showModal.toggle()}) {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height:30)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    if showModal {
                        Rectangle() // the semi-transparent overlay
                            .foregroundColor(Color.black.opacity(0.5))
                            .edgesIgnoringSafeArea(.all)

                        GeometryReader { geometry in // the modal container
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .overlay(AddPlantView(showModal: self.$showModal))
                        }
                        .transition(.move(edge: .bottom))
                    }
                }.navigationTitle("My Plants")
            }
    }
}

struct MyPlantsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlantsView()
    }
}

func getImageFromDir(_ imageName: String) -> UIImage? {

//    if let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//        let fileURL = documentsUrl.appendingPathComponent(imageName)
    let fileURL = URL(string: imageName)
    if fileURL != nil {
        do {
            let imageData = try Data(contentsOf: fileURL!)
            return UIImage(data: imageData)
        } catch {
            print("Not able to load image")
        }
    }
    return nil
}
