//
//  GameSetupViewModel.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 04.04.2026.
//

import Foundation
import SwiftUI
import Combine
import Factory

@MainActor
final class GameSetupViewModel: ObservableObject {
    
    @Injected(\.appModeStore) var appModeStore
    @Injected(\.gameSetupStore) var gameSetupStore
    
    @Published var player1: PlayerProfile = .defaultPlayer1 {
        didSet { gameSetupStore.player1 = player1 }
    }
    @Published var player2: PlayerProfile = .defaultPlayer2 {
        didSet { gameSetupStore.player2 = player2 }
    }
    @Published var selectedDifficulty: Difficulty = .medium {
        didSet { gameSetupStore.selectedDifficulty = selectedDifficulty }
    }
    @Published var selectedFirstTurn: FirstTurn = .random {
        didSet { gameSetupStore.selectedFirstTurn = selectedFirstTurn }
    }
    
    init() {
        getSetupInfo()
    }
    
    func startGame() {
        appModeStore.goGameMode()
    }
        
}

private extension GameSetupViewModel {
    
    func getSetupInfo() {
        player1 = gameSetupStore.player1
        player2 = gameSetupStore.player2
        selectedDifficulty = gameSetupStore.selectedDifficulty
        selectedFirstTurn = gameSetupStore.selectedFirstTurn
    }
    
}
