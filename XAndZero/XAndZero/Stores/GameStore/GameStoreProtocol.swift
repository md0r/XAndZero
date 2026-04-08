//
//  GameStoreProtocol.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 08.04.2026.
//

import Foundation

protocol GameStoreProtocol {
  func validateMove(row: Int, col: Int, board: Board, gameState: GameState) throws
  func checkWin(in board: Board, for cellSymbol: CellState) -> [CellCoordinate]?
  func isBoardFull(_ board: Board) -> Bool
  func botBestMove(in board: [[CellState]], difficulty: Difficulty) -> CellCoordinate
}
