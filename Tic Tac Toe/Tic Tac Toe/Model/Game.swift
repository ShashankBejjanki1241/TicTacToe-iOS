//
//  Game.swift
//  Tic Tac Toe
//
//  Created by shashank bejjanki on 2/13/25.
//

import Foundation
import SwiftUI

enum Player {
    case x
    case o
    
    var symbol: String {
        switch self {
        case .x: return "X"
        case .o: return "O"
        }
    }
    
    var color: Color {
        switch self {
        case .x: return .blue
        case .o: return .red
        }
    }
}



struct Score {
    var x: Int = 0
    var o: Int = 0
    var draws: Int = 0
}

struct Move {
    let player: Player
    let position: Int
}
