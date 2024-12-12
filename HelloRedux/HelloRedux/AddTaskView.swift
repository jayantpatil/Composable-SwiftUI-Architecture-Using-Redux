//
//  AddTaskView.swift
//  HelloRedux
//
//  Created by Jayant D Patil on 12/12/24.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var store: Store<AppState>
    @State private var name: String = ""

    struct Props {
        let tasks: [Task]
        let onTaskAdded: (Task) -> ()
    }

    private func map(state: TaskState) -> Props {
        Props(tasks: state.tasks, onTaskAdded: { task in
           store.dispatch(action: AddTaskAction(task: task))
       })
    }

    var body: some View {
        let props = map(state: store.state.taskState)
        VStack {
            TextField("Enter Task: ", text: $name)
            Button("Add") {
                props.onTaskAdded(Task(title: name))
            }
            Spacer()
            List(props.tasks, id: \.id) {
                Text($0.title)
            }
        }.padding()
    }
}

#Preview {
    AddTaskView()
        .environmentObject(Store(reducer: appReducer, state: AppState()))
}
