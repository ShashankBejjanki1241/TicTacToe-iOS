//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by shashank bejjanki on 2/11/25.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 20) {
            titleSection
            scoreBoard
            statusText
            gameBoard
            controlButtons
        }
        .padding()
        .background(Color(.systemBackground))
    }
    
    private var titleSection: some View {
        Text("Tic Tac Toe")
            .font(.system(size: 40, weight: .bold))
            .foregroundColor(.primary)
    }
    
    private var scoreBoard: some View {
        HStack(spacing: 30) {
            ScoreView(player: "Player X", score: viewModel.score.x, color: .blue)
            ScoreView(player: "Draws", score: viewModel.score.draws, color: .gray)
            ScoreView(player: "Player O", score: viewModel.score.o, color: .red)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
    
    private var statusText: some View {
        Group {
            switch viewModel.gameState {
            case .playing:
                HStack {
                    Text("Current Player:")
                    Text(viewModel.currentPlayer.symbol)
                        .foregroundColor(viewModel.currentPlayer.color)
                        .matchedGeometryEffect(id: "playerSymbol", in: animation)
                }
            case .draw:
                Text("Game Draw!")
                    .foregroundColor(.orange)
            case .win(let player):
                Text("Player \(player.symbol) Wins!")
                    .foregroundColor(player.color)
            }
        }
        .font(.title2)
        .bold()
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .animation(.spring(response: 0.5, dampingFraction: 0.7), value: viewModel.gameState)
    }
    
    private var gameBoard: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 15) {
            ForEach(0..<9) { index in
                CellView(symbol: viewModel.board[index],
                        currentPlayer: viewModel.currentPlayer) {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        viewModel.makeMove(at: index)
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
    
    private var controlButtons: some View {
        HStack(spacing: 20) {
            Button("Reset Game") {
                withAnimation(.spring()) {
                    viewModel.resetGame()
                }
            }
            .buttonStyle(GameButtonStyle(color: .blue))
            
            Button("Reset Score") {
                withAnimation(.spring()) {
                    viewModel.resetScore()
                }
            }
            .buttonStyle(GameButtonStyle(color: .red))
        }
    }
}

struct ScoreView: View {
    let player: String
    let score: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text(player)
                .font(.headline)
                .foregroundColor(color)
            Text("\(score)")
                .font(.title)
                .bold()
                .foregroundColor(color)
        }
        .padding(.vertical, 8)
    }
}

struct CellView: View {
    let symbol: String?
    let currentPlayer: Player
    let action: () -> Void
    
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Button(action: {
            scale = 0.8
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3)) {
                scale = 1
            }
            action()
        }) {
            Text(symbol ?? "")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(symbolColor)
                .frame(width: 80, height: 80)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.1),
                               radius: 5, x: 0, y: 2)
                )
        }
        .scaleEffect(scale)
        .disabled(symbol != nil)
    }
    
    private var symbolColor: Color {
        guard let symbol = symbol else { return .clear }
        return symbol == "X" ? .blue : .red
    }
}

struct GameButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding()
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.spring(), value: configuration.isPressed)
    }
}

#Preview {
    GameView()
}
