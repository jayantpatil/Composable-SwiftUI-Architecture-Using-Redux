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

func reducer(_ state: State, _ action: Action) -> State {
    state
}

class Store {
    var reducer: Reducer
    var state: State

    init(reducer: @escaping Reducer, state: State) {
        self.reducer = reducer
        self.state = state
    }
}
