//
//  AppModeLiveStore.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 02.04.2026.
//
import Foundation
import Combine

@MainActor
final class AppModeLiveStore: ObservableObject {
    
    @Published private(set) var appMode: AppMode = .gameSetup
    
    func goGameMode() {
        appMode = .game
    }
    func goSetupMode() {
        appMode = .gameSetup
    }
}
