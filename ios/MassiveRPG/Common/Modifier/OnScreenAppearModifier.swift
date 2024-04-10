//
//  OnScreenAppearModifier.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

public let isPreview: Bool = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"

struct OnScreenAppearModifier: ViewModifier {
    // MARK: Variables

    let perform: () -> Void

    // MARK: Life Cycle

    init(perform: @escaping () -> Void) {
        self.perform = perform
    }

    func body(content: Content) -> some View {
        content
            .onAppear(perform: onAppear)
    }

    func onAppear() {
        if !isPreview {
            perform()
        }
    }
}

extension View {
    func onScreenAppear(perform: @escaping () -> Void) -> some View {
        modifier(OnScreenAppearModifier(perform: perform))
    }
}
