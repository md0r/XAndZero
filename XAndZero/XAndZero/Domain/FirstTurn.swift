//
//  Difficulty.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 04.04.2026.
//

import Foundation

enum FirstTurn: String, CaseIterable {
    case you
    case opponent
    case random
}

extension FirstTurn: CustomStringConvertible {
    var description: String {
        rawValue.capitalized
    }
}
