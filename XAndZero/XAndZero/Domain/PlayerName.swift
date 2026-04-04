//
//  PlayerName.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 02.04.2026.
//

import Foundation

enum PlayerName {
    case player1
    case player2
    case ai
}

extension PlayerName: CustomStringConvertible {
    var description: String {
        switch self {
        case .player1:
            return "Player 1"
        case .player2:
            return "Player 2"
        case .ai:
            return "AI"
        }
    }
}
