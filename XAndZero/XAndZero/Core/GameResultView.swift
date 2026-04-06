//
//  GameResultView.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 06.04.2026.
//

import SwiftUI

struct GameResultView: View {
    
    let gameState: GameState
    let resetGame: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            TitleView(gameState: gameState)
            if let winnerPlayer = gameState.winnerPlayer {
                WinnerPlayerView(winnerPlayer: winnerPlayer)
            }
            PlayAgainButton(resetGame: resetGame)
        }
        .padding()
        .infinityFrame()
        .background(Color.appTheme.viewBackground)
        .presentationDetents([.height(GameConstants.winnerSheetHeight)])
        .presentationCornerRadius(AppCornerRadius.overall.value)
        .presentationDragIndicator(.visible)
    }
}


private struct TitleView: View {
    
    let gameState: GameState
    
    var body: some View {
        Text(gameState.isTied ? "🤝 It's a Tie!" : "🎉 Game Over!")
          .font(.title)
          .fontWeight(.bold)
          .foregroundStyle(gameState.isTied ? Color.appTheme.alternateAccent : Color.appTheme.success)
    }
}

private struct WinnerPlayerView: View {
    
    let winnerPlayer: Player
    
    var body: some View {
        HStack(spacing: 8) {
            Text("Winner:")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(Color.appTheme.secondaryText)
            
            Image(winnerPlayer.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
            
            Text(winnerPlayer.cellSymbol.symbol)
                .font(.title)
                .fontWeight(.heavy)
                .fontDesign(.rounded)
                .foregroundStyle(winnerPlayer.cellSymbol.color)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(
                    RoundedRectangle(cornerRadius: AppCornerRadius.overall.value)
                        .fill(winnerPlayer.cellSymbol.color.opacity(0.2))
                )
        }
    }
}

private struct PlayAgainButton: View {
    
    let resetGame: () -> Void
    
    var body: some View {
        Label("Play Again", systemImage: "arrow.counterclockwise.circle.fill")
            .primaryButton()
            .button(.press) {
                resetGame()
            }
    }
}
