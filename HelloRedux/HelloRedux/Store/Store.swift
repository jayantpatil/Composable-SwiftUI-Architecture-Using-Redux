//
//  Store.swift
//  HelloRedux
//
//  Created by Jayant D Patil on 09/12/24.
//

import Foundation

protocol Action {}
protocol ReduxState {}
typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State

struct AppState: ReduxState {
    var counterState = CounterState()
    var taskState = TaskState()
}

struct CounterState: ReduxState {
    var counter: Int = 0
}

struct TaskState: ReduxState {
    var tasks: [Task] = []
}

struct IncrementAction: Action {}
struct DecrementAction: Action {}
struct AddAction: Action {
    let value: Int
}

struct AddTaskAction: Action {
    let task: Task
}

class Store<StoreState: ReduxState>: ObservableObject {
    var reducer: Reducer<StoreState>
    @Published var state: StoreState

    init(reducer: @escaping Reducer<StoreState>, state: StoreState) {
        self.reducer = reducer
        self.state = state
    }

    func dispatch(action: Action) {
        state = reducer(state, action)
    }
}
