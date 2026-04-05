//
//  GameSetupLiveStore.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 04.04.2026.
//

import Foundation
import Combine

@MainActor
final class GameSetupLiveStore: ObservableObject {
    
    @Published var player1: PlayerProfile = .defaultPlayer1
    @Published var player2: PlayerProfile = .defaultPlayer2
    @Published var selectedDifficulty: Difficulty = .medium
    @Published var selectedFirstTurn: FirstTurn = .random
    
}
