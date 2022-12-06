//
//  AddTaskView.swift
//  Plant Parenthood
//
//  Created by Lindsay Morel on 12/5/22.
//

import SwiftUI

struct AddTaskView: View {
    @Binding var showModal2: Bool
    @State var taskName: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                Form {
                    Section(header: Text("Enter task name:")) {
                        TextField("Task name", text: $taskName)
                    }
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
