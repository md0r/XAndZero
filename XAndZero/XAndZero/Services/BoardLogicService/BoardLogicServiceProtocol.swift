//
//  BoardLogicServiceProtocol.swift
//  TicTacToe-TheOne-Course
//
//  Created by Raul Gutierrez Niubo on 9/24/25.
//

import Foundation

protocol BoardLogicServiceProtocol {
  func validateMove(row: Int, col: Int, board: Board, gameState: GameState) throws
  func checkWin(in board: Board, for cellSymbol: CellState) -> [CellCoordinate]?
  func isBoardFull(_ board: Board) -> Bool
}
