//
//  ErrorHandlerService.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 06.04.2026.
//

import Foundation

protocol ErrorHandlerProtocol {
    func handle(_ error: GameError)
    func logError(_ error: GameError)
}

final class ErrorHandlerService: ErrorHandlerProtocol {
    func handle(_ error: GameError) {
        #if DEBUG
        logError(error)
        #endif
    }
    func logError(_ error: GameError) {
        print("Game error: \(error.errorDescription ?? "Unknown error")")
    }
}
