//
//  MassiveRPGApp.swift
//  MassiveRPG
//
//  Created by Onur Var on 6.04.2024.
//

import SwiftUI

@main
struct MassiveRPGApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootScreenView(viewModel: .init())
        }
    }
}
