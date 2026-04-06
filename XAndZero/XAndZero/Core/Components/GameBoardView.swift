//
//  GameBoardView.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 06.04.2026.
//

import SwiftUI

struct GameBoardView: View {
    
  let board: Board
  let winningCells: [CellCoordinate]
  let onCellTap: (Int, Int) -> ()
  
  var body: some View {
    VStack(spacing: GameConstants.boardSpacing) {
      ForEach(0..<GameConstants.boardSize, id: \.self) { row in
        HStack(spacing: GameConstants.boardSpacing) {
          ForEach(0..<GameConstants.boardSize, id: \.self) { col in
            let coord = CellCoordinate(row: row, col: col)
            CellView(
              state: board[row][col],
              isWinningCell: winningCells.contains(coord)
            )
            .button(.press) {
              withAnimation(.spring) {
                onCellTap(row, col)
              }
            }
          }
        }
      }
    }
  }
}

