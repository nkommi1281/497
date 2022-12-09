import SwiftUI

struct ScheduleView: View {

    @State private var date = Date()
    @State var isChecked: Bool = false
    @State private var isPresentingConfirm3: Bool = false
    @EnvironmentObject var thePlantItemList: PlantItemList
    func toggle(){
        isPresentingConfirm3.toggle()
    }
    var body: some View {
        ZStack {
            Color.green.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Task Calendar")
                        .font(.system(size: 33))
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .padding()
                    Spacer()
                }
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                HStack {
                    Text("Tasks for \(date.formatted(.dateTime.day().month().year())):")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                List {
                    ForEach(thePlantItemList.getPlantItemList(), id: \.self) { item in
                         ForEach(item.getTasks(), id: \.self) { task in
                             if task.days.contains(date.formatted(.dateTime.day().month().year())){
                                
                                 HStack{
                                     Button(action: toggle) {
                                         Image(systemName: isChecked ? "checkmark.square" : "square")
                                     }.confirmationDialog("Are you sure?", isPresented: $isPresentingConfirm3) {
                                         Button("Delete this day from the task?", role: .destructive) {
                                             thePlantItemList.removePlantTaskDay(plantItem: item, taskItem: task, dayItem: date.formatted(.dateTime.day().month().year()))
                                         }
                                     }
                                     Text("\(task.name) for plant: \(item.plantItemName)")
                                         .font(.system(size: 22))
                                         .fontWeight(.bold)
                                 }
                                 
                             }
                        }
                    }
                    .listRowBackground(Color.purple.opacity(0.2))
                }
                .background(Color.green.opacity(0.2))
                .scrollContentBackground(.hidden)
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
