//
//  TaskReducer.swift
//  HelloRedux
//
//  Created by Jayant D Patil on 12/12/24.
//

import Foundation

func taskReducer(_ state: TaskState, _ action: Action) -> TaskState {
    var state = state

    switch action {
    case let addAction as AddTaskAction:
        state.tasks.append(addAction.task)

    default:
        break
    }

    return state
}
