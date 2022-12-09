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
    @State private var selectedFreq = "Daily"
      let frequencies = ["One-Time", "Daily", "Weekly", "Monthly"]
    var plantItem: PlantItem
    var body: some View {
         NavigationStack {
                 Form {
                     Section(header: Text("Enter task name:").font(.headline).fontWeight(.bold)) {
                         TextField("Task name", text: $taskName)
                             .frame(height: 20)
                     }.textCase(nil)
                     Section {
                           Picker("Frequency", selection: $selectedFreq) {
                               ForEach(frequencies, id: \.self) {
                                   Text($0)
                               }
                           }
                       }
                     Text("Choose task start date:").font(.headline).fontWeight(.bold).foregroundColor(.black.opacity(0.4))
                     DatePicker(
                         "Start Date",
                         selection: $date,
                         displayedComponents: [.date]
                     )
                     .datePickerStyle(.graphical)
                     Button("Add Task"){
                                              // do stuff
                                              var days: [String] = []
                                              if (selectedFreq == "Weekly") {

                                                  days.append(date.formatted(.dateTime.day().month().year()))
                                                  print(days)
                                                  var nextweek = date
                                                  var dateComponent = DateComponents()
                                                  dateComponent.day = 7
                                                  for _ in 1...5 {
                                                      nextweek = Calendar.current.date(byAdding: dateComponent, to: nextweek)!
                                                      days.append(nextweek.formatted(.dateTime.day().month().year()))
                                                  }



                                              } else if (selectedFreq == "Daily") {
                                                  days.append(date.formatted(.dateTime.day().month().year()))
                                                  var nextday = date
                                                 for _ in 1...50 {
                                                     nextday = nextday.addingTimeInterval(60*60*24)
                                                     days.append(nextday.formatted(.dateTime.day().month().year()))
                                                 }
                                                 let nextweek = date.addingTimeInterval(60*60*24)
                                                 days.append(nextweek.formatted(.dateTime.day().month().year()))
                                                 print(days)
                                             } else if (selectedFreq == "Monthly") {
                                                 days.append(date.formatted(.dateTime.day().month().year()))
                                                 var nextmonth = date
                                                 var dateComponent = DateComponents()
                                                 dateComponent.month = 1
                                                 for _ in 1...3 {
                                                      nextmonth = Calendar.current.date(byAdding: dateComponent, to: nextmonth)!
                                                      days.append(nextmonth.formatted(.dateTime.day().month().year()))
                                                  }
                                                 print(days)
                                             } else if (selectedFreq == "One-Time") {
                                                 days.append(date.formatted(.dateTime.day().month().year()))
                                             }
                         
                                            let plantTask = Task(namevar: taskName, freqvar: selectedFreq, daysvar: days)
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
        }.navigationTitle("Add New Task")
        
    }
}

//struct AddTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTaskView()
//    }
//}
