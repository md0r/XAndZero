//
//  GameState.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 06.04.2026.
//

import Foundation

enum GameState: Equatable {
  case playing
  case won(Player)
  case tied
  
  var isGameOver: Bool {
    switch self {
    case .playing: false
    case .won, .tied: true
    }
  }
  
  var isTied: Bool {
    self == .tied
  }
  
  var winnerPlayer: Player? {
    switch self {
    case .won(let player): player
    case .tied, .playing: nil
    }
  }
}
