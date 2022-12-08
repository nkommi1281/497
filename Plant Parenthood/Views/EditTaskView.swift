//
//  EditTaskView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 12/8/22.
//

import SwiftUI

struct EditTaskView: View {
    @EnvironmentObject var thePlantItemList: PlantItemList
    @Binding var showModal3: Bool
    @State var taskName: String = ""
    @State var frequency: String = ""
    @State private var date = Date()
    @State private var selectedFreq = "Daily"
    let frequencies = ["Daily", "Weekly", "Monthly"]
    var plantItem: PlantItem
    var taskItem: Task
    
    var body: some View {
        NavigationStack {
                Form {
                    Section(header: Text("Enter task name:").font(.headline).fontWeight(.bold)) {
                        TextField("\(taskItem.name)", text: $taskName)
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
                    Button("Save Changes"){
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
                        }
                        let plantTask = Task(namevar: taskName, freqvar: selectedFreq, daysvar: days)
                        thePlantItemList.removePlantTask(plantItem: plantItem, taskItem: taskItem)
                        thePlantItemList.addPlantTask(plantItem: plantItem, taskItem: plantTask)
                        self.showModal3.toggle()
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 50)
                    .background(Color.green.opacity(0.5))
                    .cornerRadius(16)
                    .foregroundColor(.black)
                }
       }.navigationTitle("Edit Task")
    }
}
//
//struct EditTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditTaskView()
//    }
//}
