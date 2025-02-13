//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by shashank bejjanki on 2/11/25.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .bold()
            
            statusText
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 15) {
                ForEach(0..<9) { index in
                    CellView(symbol: viewModel.board[index]) {
                        viewModel.makeMove(at: index)
                    }
                }
            }
            .padding()
            
            Button("Reset Game") {
                viewModel.resetGame()
            }
            .font(.headline)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
    
    private var statusText: some View {
        Group {
            switch viewModel.gameState {
            case .playing:
                Text("Current Player: \(viewModel.currentPlayer.symbol)")
            case .draw:
                Text("Game Draw!")
                    .foregroundColor(.orange)
            case .win(let player):
                Text("Player \(player.symbol) Wins!")
                    .foregroundColor(.green)
            }
        }
        .font(.title2)
        .bold()
    }
}

struct CellView: View {
    let symbol: String?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(symbol ?? "")
                .font(.system(size: 40, weight: .bold))
                .frame(width: 80, height: 80)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .disabled(symbol != nil)
    }
}

#Preview {
    GameView()
}
