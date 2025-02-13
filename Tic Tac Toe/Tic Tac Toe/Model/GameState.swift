//
//  GameState.swift
//  Tic Tac Toe
//
//  Created by shashank bejjanki on 2/13/25.
//

import Foundation

enum GameState: Equatable {  // Added ": Equatable" here
    case playing
    case draw
    case win(Player)
    
    // Add this entire static func
    static func == (lhs: GameState, rhs: GameState) -> Bool {
        switch (lhs, rhs) {
        case (.playing, .playing):
            return true
        case (.draw, .draw):
            return true
        case (.win(let player1), .win(let player2)):
            return player1 == player2
        default:
            return false
        }
    }
}
