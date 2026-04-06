//
//  Board.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 06.04.2026.
//

import Foundation

typealias Board = [[CellState]]

extension Board {
  static var empty: Self {
    .init(repeating: .init(repeating: .empty, count: GameConstants.boardSize), count: GameConstants.boardSize)
  }
}
