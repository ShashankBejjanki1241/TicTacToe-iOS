# Tic Tac Toe iOS Game

A modern, animated Tic Tac Toe game built with SwiftUI following MVVM architecture pattern.

## Features

- Clean, modern UI with animations
- Score tracking system
- Two-player gameplay
- Spring animations for moves and state changes
- Color-coded players (X: Blue, O: Red)
- Game state management
- Reset game and score functionality
- Responsive layout

## Project Structure
'''
TicTacToe/
├── Model/
│   ├── Player.swift         # Player enum and properties
│   ├── GameState.swift      # Game state management
│   ├── Score.swift          # Score tracking structure
│   ├── Move.swift          # Move structure
│   └── GameBoard.swift      # Core game logic
├── ViewModel/
│   └── GameViewModel.swift  # Game state and UI logic bridge
├── Views/
│   ├── GameView.swift       # Main game view
│   └── Components/
│       ├── ScoreView.swift      # Score display component
│       ├── CellView.swift       # Game cell component
│       └── GameButtonStyle.swift # Custom button styling
└── App.swift               # App entry point
'''
## Requirements

- iOS 14.0+
- Xcode 13.0+
- Swift 5.5+

## Installation

1. Clone the repository
2. Open `TicTacToe.xcodeproj` in Xcode
3. Build and run the project
