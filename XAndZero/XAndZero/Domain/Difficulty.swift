//
//  Difficulty.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 04.04.2026.
//

import Foundation

enum Difficulty: String, CaseIterable {
    case easy
    case medium
    case hard
}

extension Difficulty: CustomStringConvertible {
    var description: String {
        rawValue.capitalized
    }
}
