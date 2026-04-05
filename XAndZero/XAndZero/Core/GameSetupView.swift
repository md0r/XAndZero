//
//  GameSetupView.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 04.04.2026.
//

import SwiftUI

struct GameSetupView: View {
   
    @StateObject var viewModel = GameSetupViewModel()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 20) {
                LogoView()
                WelcomeText()
                VStack(spacing: 28) {
                    PlayerSelectionView(player1: $viewModel.player1, player2: $viewModel.player2)
                    SelectionGroupView(title: "Difficulty", options: Difficulty.allCases, selectedOption: $viewModel.selectedDifficulty)
                    SelectionGroupView(title: "Who Goes First?", options: FirstTurn.allCases, selectedOption: $viewModel.selectedFirstTurn)
                }
                Spacer()
                StartButton(viewModel: viewModel)
            }
            .infinityFrame()
            .padding()
            .background(Color.appTheme.viewBackground)
            
            ColorSchemeToggleView()
            
        }
    }
}

private struct ColorSchemeToggleView: View {
    @AppStorage(UserDefaultKeys.isDarkMode) private var isDarkMode = true
    func toggleColorScheme() {
        isDarkMode.toggle()
    }
    var body: some View {
        Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .foregroundStyle(isDarkMode ? Color.appTheme.alternateAccent : Color.appTheme.accent)
            .padding()
            .button(.press) {
                toggleColorScheme()
            }
        
    }
}

private struct LogoView: View {
    var body: some View {
        Image(.logo)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .foregroundStyle(Color.appTheme.accent)
    }
}

private struct WelcomeText: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("X and Zero")
                .font(.title)
                .bold()
                .foregroundStyle(Color.appTheme.accent)
            Text("A two-player game of tic-tac-toe.")
                .foregroundStyle(Color.appTheme.secondaryText)
                .fontWeight(.medium)
        }
    }
}

private struct StartButton: View {
    
    var viewModel: GameSetupViewModel
    
    var body: some View {
        HStack(spacing: 5) {
           Image(systemName: "flame")
           Text("Start Battle")
        }
        .primaryButton()
        .button(.press) {
            viewModel.startGame()
        }
    }
}
