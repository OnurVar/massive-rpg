//
//  GoogleSignInButtonView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

import GoogleSignIn
import SwiftUI

struct GoogleSignInButton: UIViewRepresentable {
    // MARK: Variables

    let action: () -> Void
    @Environment(\.colorScheme) var colorScheme
    private var button: GIDSignInButton = .init()

    // MARK: Life Cycle

    init(action: @escaping () -> Void) {
        self.action = action
    }

    // MARK: Methods

    func makeUIView(context: Context) -> GIDSignInButton {
        button.colorScheme = colorScheme == .dark ? .dark : .light
        button.addTarget(context.coordinator, action: #selector(Coordinator.onPress), for: .touchUpInside)
        return button
    }

    func updateUIView(_: UIViewType, context _: Context) {
        button.colorScheme = colorScheme == .dark ? .dark : .light
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parentView: self)
    }

    class Coordinator: NSObject {
        private let parentView: GoogleSignInButton

        // MARK: Life Cycle

        init(parentView: GoogleSignInButton) {
            self.parentView = parentView
        }

        // MARK: Actions

        @objc func onPress() {
            parentView.action()
        }
    }
}

#Preview {
    GoogleSignInButton(action: {
        print("GoogleSignInButton:action")
    })
}
