//
//  CellState.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 06.04.2026.
//
import SwiftUI

enum CellState {
    case empty
    case x
    case o
    
    var symbol:String {
        switch self {
        case .empty: return ""
        case .x: return "X"
        case .o: return "O"
        }
    }
    
    var color: Color {
        switch self {
        case .empty: return Color.clear
        case .x: return Color.appTheme.accent
        case .o: return Color.appTheme.alternateAccent
        }
    }
    
}
