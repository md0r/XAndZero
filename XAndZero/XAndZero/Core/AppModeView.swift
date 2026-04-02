//
//  AppModeView.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 01.04.2026.
//

import SwiftUI

struct AppModeView: View {
    
    @StateObject private var viewModel = AppModeViewModel()
    
    var body: some View {
        Group {
            switch viewModel.appMode {
            case .gameSetup:
                Text("gamesetup")
            case .game:
                Text("game")
            }
        }
        .animation(.easeIn, value: viewModel.appMode)
    }
}

#Preview {
    AppModeView()
}
