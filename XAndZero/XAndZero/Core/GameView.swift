//
//  GameView.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 08.04.2026.
//

import SwiftUI

enum ButtonSize {
  case medium
  case large
    
    var size: CGFloat {
      switch self {
      case .medium: 45
      case .large: 60
      }
    }
}

struct GameView: View {
    
    @StateObject private var viewModel: GameViewModel = .init()
    
    var body: some View {
        VStack {
            PlayerStatsView(viewModel: viewModel)
            Spacer()
            GameBoardView(board: viewModel.board, winningCells: viewModel.winningCells) { row, col in
                viewModel.playHumanMove(row: row, col: col)
            }
            .disabled(viewModel.isPlayHumanMoveDisabled)
            Spacer()
            ActionButtonsView(viewModel: viewModel)
        }
        .infinityFrame()
        .padding()
        .background(Color.appTheme.viewBackground)
        .sheet(isPresented: Binding(get: {
            viewModel.showWinnerSheet
        }, set: { _ in
            
        })) {
            GameResultView(gameState: viewModel.gameState, resetGame: viewModel.resetGame)
        }
        
    }
}

private struct PlayerStatsView: View {
    let viewModel: GameViewModel
    var body: some View {
        HStack(spacing: 0) {
            PlayerInGameView(player: viewModel.player1.profile, orientation: .left, isCurrentPlayer: viewModel.currentPlayer.cellSymbol == .x, winsCount: viewModel.player1.wins)
            Spacer(minLength: 5)
            PlayerInGameView(player: viewModel.player2.profile, orientation: .right, isCurrentPlayer: viewModel.currentPlayer.cellSymbol == .o, winsCount: viewModel.player2.wins)
            
        }
        .animation(.easeIn(duration: GameConstants.playerSwapAnimationDuration), value: viewModel.currentPlayer.cellSymbol)
        .transition(.opacity.combined(with: .scale))
    }
}

private struct ActionButtonsView: View {
    
    let viewModel: GameViewModel
    
    var body: some View {
        HStack(spacing: 32) {
            ActionButtonView(sfsymbol: "house", buttonSize: .medium)
            .opacity(0)
            ActionButtonView(sfsymbol: "arrow.clockwise", buttonSize: .large)
            .button(.press) {
              viewModel.resetGame()
            }
            ActionButtonView(sfsymbol: "house", buttonSize: .medium)
            .button(.press) {
              viewModel.goSetupMode()
            }
        }
    }
}

private struct ActionButtonView: View {
    
    let sfsymbol: String
    let buttonSize: ButtonSize
    
    var body: some View {
        Image(systemName: sfsymbol)
          .resizable()
          .scaledToFit()
          .padding(12)
          .foregroundColor(Color.appTheme.text.opacity(0.6))
          .frame(width: buttonSize.size, height: buttonSize.size)
          .background(Color.appTheme.cellBackground)
          .clipShape(Circle())
          .shadow(.regular)
    }
}


