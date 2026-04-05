//
//  XAndZeroApp.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 01.04.2026.
//

import SwiftUI

@main
struct XAndZeroApp: App {
    
    @AppStorage(UserDefaultKeys.isDarkMode) private var isDarkMode: Bool = true
    
    var body: some Scene {
        WindowGroup {
            AppModeView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
