import SwiftUI

struct ScheduleView: View {

    @State private var date = Date()
    @EnvironmentObject var thePlantItemList: PlantItemList
    //let tasks = ["Water - Plant #1", "Fertilize - Plant #2", "Water - Plant #2"]
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
                                 Text("\(task.name) for plant: \(item.plantItemName)")
                                     .fontWeight(.bold)
                             }
                        }
                    }
                    .listRowBackground(Color.purple.opacity(0.2))
                }
                .background(Color.green.opacity(0.4))
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
