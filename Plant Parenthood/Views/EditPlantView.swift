//
//  EditPlantView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 12/8/22.
//

import SwiftUI

struct EditPlantView: View {
    @Binding var showModal4: Bool
    @EnvironmentObject var thePlantItemList: PlantItemList
    @State var name: String = ""
    @State var species: String = ""
    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var changePhotoView = false
    var plantItem: PlantItem
    var body: some View {
        NavigationView {
                Form {
                    HStack {
                        Spacer()
                        let existingImage = getImageFromDir(plantItem.plantItemURL)
                        if existingImage != nil && !changePhotoView {
                            Image(uiImage: existingImage!)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .background(Color.black.opacity(0.2))
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .rotationEffect(.degrees(90))
                                .padding(8)
                        }
                        else {
                            Image(uiImage: self.image)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .background(Color.black.opacity(0.2))
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .padding(8)
                        }
                        Spacer()
                    }
                    Text("Change Photo")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.green.opacity(0.5))
                        .cornerRadius(16)
                        .foregroundColor(.black)
                        .onTapGesture {
                            showSheet = true
                            changePhotoView = true
                        }
                    Section(header: Text("Plant Information")) {
                        TextField("\(plantItem.plantItemName)", text: $name)
                        TextField("\(plantItem.plantItemSpecies)", text: $species)
                    }
                    Button("Update Plant Profile") {
                        //save the info somehow
                        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                        let url = documents.appendingPathComponent("\(name).png")
                        let urlstring = url.absoluteString
                        if let data = image.pngData() {
                            do {
                                try data.write(to: url)
                            } catch {
                                print("Unable to Write Image Data to Disk")
                            }
                        }
                        var userPlantItem = PlantItem(name: name, species: species, imageName: name, url: urlstring)
                        for transferTask in plantItem.getTasks() {
                            userPlantItem.addTask(task: transferTask)
                        }
                        thePlantItemList.removePlantItem(trashPlantItem: plantItem)
                        thePlantItemList.addPlantItem(newPlantItem: userPlantItem)
                        self.showModal4.toggle()
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 50)
                    .background(Color.green.opacity(0.5))
                    .cornerRadius(16)
                    .foregroundColor(.black)
                }
                .sheet(isPresented: $showSheet) {
                    ImagePicker(sourceType: .camera, selectedImage: self.$image)
                }
        }
        .navigationTitle("Edit Plant")
    }
}

//struct EditPlantView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditPlantView()
//    }
//}
