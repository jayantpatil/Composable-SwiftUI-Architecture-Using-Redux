//
//  Store.swift
//  HelloRedux
//
//  Created by Jayant D Patil on 09/12/24.
//

import Foundation

protocol Action {}
typealias Reducer = (_ state: State, _ action: Action) -> State

struct State {
    var counter: Int = 0
}

struct IncrementAction: Action {}

func reducer(_ state: State, _ action: Action) -> State {
    var state = state
    switch action {
    case _ as IncrementAction:
        state.counter += 1

    default:
        break
    }

    return state
}

class Store: ObservableObject {
    var reducer: Reducer
    @Published var state: State

    init(reducer: @escaping Reducer, state: State) {
        self.reducer = reducer
        self.state = state
    }

    func dispatch(action: Action) {
        state = reducer(state, action)
    }
}
