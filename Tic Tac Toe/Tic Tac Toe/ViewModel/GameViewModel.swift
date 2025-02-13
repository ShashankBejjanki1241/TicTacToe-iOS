//
//  GameViewModel.swift
//  Tic Tac Toe
//
//  Created by shashank bejjanki on 2/13/25.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published private var gameBoard = GameBoard()
    
    var board: [String?] {
        gameBoard.getBoardState()
    }
    
    var currentPlayer: Player {
        gameBoard.currentPlayer
    }
    
    var gameState: GameState {
        gameBoard.gameState
    }
    
    func makeMove(at position: Int) {
        if gameBoard.makeMove(at: position) {
            objectWillChange.send()
        }
    }
    
    func resetGame() {
        gameBoard.reset()
        objectWillChange.send()
    }
}
