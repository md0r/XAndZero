//
//  PlayerType.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 02.04.2026.
//

import Foundation

enum PlayerType {
    case human
    case bot
}

extension PlayerType {
    var isHuman: Bool {
        self == .human
    }
    var isBot: Bool {
        self == .bot
    }
}
