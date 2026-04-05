//
//  PlayerProfile.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 02.04.2026.
//

import Foundation
import SwiftUI

struct PlayerProfile: Equatable {
    let name: PlayerName
    var image: ImageResource
    let type: PlayerType
}

extension PlayerProfile {
  static var defaultPlayer1: Self {
    .init(name: .player1, image: .playerBoy1, type: .human)
  }
  
  static var defaultPlayer2: Self {
    .init(name: .ai, image: .playerBot1, type: .bot)
  }
}
