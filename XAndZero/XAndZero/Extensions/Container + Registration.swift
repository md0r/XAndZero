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
}
