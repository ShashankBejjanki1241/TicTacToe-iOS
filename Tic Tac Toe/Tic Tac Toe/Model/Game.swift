//
//  Game.swift
//  Tic Tac Toe
//
//  Created by shashank bejjanki on 2/13/25.
//

import Foundation
enum Player {
    case x
    case o
    
    var symbol: String {
        switch self {
        case .x: return "X"
        case .o: return "O"
        }
    }
}

enum GameState {
    case playing
    case draw
    case win(Player)
}

struct Move {
    let player: Player
    let position: Int
}
