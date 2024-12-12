//
//  AppReducer.swift
//  HelloRedux
//
//  Created by Jayant D Patil on 10/12/24.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.counterState = counterReducer(state.counterState, action)
    state.taskState = taskReducer(state.taskState, action)
    return state
}
