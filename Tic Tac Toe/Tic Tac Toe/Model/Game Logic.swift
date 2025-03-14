//
//  Game Logic.swift
//  Tic Tac Toe
//
//  Created by shashank bejjanki on 2/13/25.
//
import Foundation
import SwiftUI

class GameBoard {
    private var board: [String?]
    private(set) var currentPlayer: Player
    private(set) var gameState: GameState
    private(set) var score: Score
    
    init() {
        board = Array(repeating: nil, count: 9)
        currentPlayer = .x
        gameState = .playing
        score = Score()
    }
    
    func makeMove(at position: Int) -> Bool {
        guard position >= 0 && position < 9,
              board[position] == nil,
              case .playing = gameState else {
            return false
        }
        
        board[position] = currentPlayer.symbol
        
        if checkWin() {
            gameState = .win(currentPlayer)
            updateScore()
        } else if checkDraw() {
            gameState = .draw
            score.draws += 1
        } else {
            currentPlayer = currentPlayer == .x ? .o : .x
        }
        
        return true
    }
    
    private func updateScore() {
        switch currentPlayer {
        case .x: score.x += 1
        case .o: score.o += 1
        }
    }
    
    func getBoardState() -> [String?] {
        return board
    }
    
    private func checkWin() -> Bool {
        let winPatterns = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
            [0, 4, 8], [2, 4, 6]             // Diagonals
        ]
        
        return winPatterns.contains { pattern in
            let symbols = pattern.map { board[$0] }
            return symbols.allSatisfy { $0 == currentPlayer.symbol }
        }
    }
    
    private func checkDraw() -> Bool {
        return !board.contains { $0 == nil }
    }
    
    func reset() {
        board = Array(repeating: nil, count: 9)
        currentPlayer = .x
        gameState = .playing
    }
    
    func resetScore() {
        score = Score()
    }
}
