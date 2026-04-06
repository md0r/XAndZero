//
//  CellView.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 06.04.2026.
//

import SwiftUI

struct CellView: View {
    
    let state: CellState
    let isWinningCell: Bool
    
    var body: some View {
        Text(state.symbol)
            .font(.system(size: GameConstants.cellFontSize))
            .fontWeight(.bold)
            .foregroundColor(state.color)
            .infinityFrame()
            .background(Color.appTheme.cellBackground)
            .cornerRadius(.cell)
            .overlay(RoundedRectangle(cornerRadius: AppCornerRadius.cell.value).stroke(Color.appTheme.success.opacity(isWinningCell ? 1 : 0), lineWidth: 3))
            .aspectRatio(1, contentMode: .fit)
            .shadow(.light)
    }
}

