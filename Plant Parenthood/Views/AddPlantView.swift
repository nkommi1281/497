//
//  AddPlantView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 11/1/22.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        imagePicker.delegate = context.coordinator

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }

    }
}


struct AddPlantView: View {
    @Binding var showModal: Bool
    @EnvironmentObject var thePlantItemList: PlantItemList
    @State var name: String = ""
    @State var species: String = ""
    @State private var image = UIImage()
    @State private var showSheet = false
    
    var body: some View {
            NavigationView {
                    Form {
                        HStack {
                            Spacer()
                            Image(uiImage: self.image)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .background(Color.black.opacity(0.2))
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .padding(8)
                            Spacer()
                        }
                        Text("Add Photo")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.green.opacity(0.5))
                            .cornerRadius(16)
                            .foregroundColor(.black)
                            .onTapGesture {
                                showSheet = true
                            }
                        Section(header: Text("Plant Information")) {
                            TextField("Plant Name", text: $name)
                            TextField("Plant Species", text: $species)
                        }
                        Button("Save New Plant Profile") {
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
                            print(urlstring)
                            let userPlantItem = PlantItem(name: name, species: species, imageName: name, url: urlstring)
                            thePlantItemList.addPlantItem(newPlantItem: userPlantItem)
                            self.showModal.toggle()
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
            .navigationBarTitle("Add New Plant")
        }
}

//struct AddPlantView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPlantView()
//    }
//}

extension URL {
    func loadImage(_ image: inout UIImage?) {
        if let data = try? Data(contentsOf: self), let loaded = UIImage(data: data) {
            image = loaded
        } else {
            image = nil
        }
    }
    func saveImage(_ image: UIImage?) {
        if let image = image {
            if let data = image.jpegData(compressionQuality: 1.0) {
                try? data.write(to: self)
            }
        } else {
            try? FileManager.default.removeItem(at: self)
        }
    }
}


