//
//  Container + Registration.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 02.04.2026.
//
import Foundation
import Factory

extension Container {
    var appModeStore: Factory<AppModeLiveStore> {
        self { MainActor.assumeIsolated { AppModeLiveStore() } }.singleton
    }
    var gameSetupStore: Factory<GameSetupLiveStore> {
        self { MainActor.assumeIsolated { GameSetupLiveStore() } }.singleton
    }
    var errorHandlerService: Factory<ErrorHandlerProtocol> {
        self { MainActor.assumeIsolated { ErrorHandlerService() } }.singleton
    }
    var analyticsService: Factory<AnalyticsProtocol> {
        self { MainActor.assumeIsolated { AnalyticsService() } }.singleton
    }
    var boardLogicService: Factory<BoardLogicServiceProtocol> {
        self { MainActor.assumeIsolated { BoardLogicService() } }.singleton
    }
    var botEngineService: Factory<BotEngineServiceProtocol> {
        self { MainActor.assumeIsolated { BotEngineService() } }.singleton
    }
    var gameStore: Factory<GameStoreProtocol> {
        self { MainActor.assumeIsolated { GameLiveStore() } }.singleton
    }
}
