//
//  AddTaskView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 12/5/22.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var thePlantItemList: PlantItemList
    @Binding var showModal2: Bool
    @State var taskName: String = ""
    @State var frequency: String = ""
    @State private var date = Date()
    var plantItem: PlantItem
    var body: some View {
         NavigationStack {
             ZStack {
                Color.green.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                 Form {
                     Section(header: Text("Enter task name:").font(.headline).fontWeight(.bold)) {
                         TextField("Task name", text: $taskName)
                             .frame(height: 20)
                         TextField("Frequency", text: $frequency)
                             .frame(height: 20)
                     }.textCase(nil)
                     Text("Choose task start date:").font(.headline).fontWeight(.bold).foregroundColor(.black.opacity(0.4))
                     DatePicker(
                         "Start Date",
                         selection: $date,
                         displayedComponents: [.date]
                     )
                     .datePickerStyle(.graphical)
                     Button("Add Task"){
                         // do stuff
                         let plantTask = Task(namevar: taskName, freqvar: frequency, daysvar: [date.formatted(.dateTime.day().month().year())])
                         thePlantItemList.addPlantTask(plantItem: plantItem, taskItem: plantTask)
                         self.showModal2.toggle()
                     }
                     .font(.headline)
                     .frame(maxWidth: .infinity, alignment: .center)
                     .frame(height: 50)
                     .background(Color.green.opacity(0.5))
                     .cornerRadius(16)
                     .foregroundColor(.black)
                 }
             }
        }
    }
}

//struct AddTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTaskView()
//    }
//}
