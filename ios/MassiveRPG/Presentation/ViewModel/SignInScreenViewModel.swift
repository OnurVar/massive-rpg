//
//  SignInScreenViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

import Factory
import SwiftUI

extension SignInScreenView {
    class ViewModel: ObservableObject {
        // MARK: Variables

        @Injected(\.signInUseCase) private var signInUseCase

        // MARK: Life Cycle

        init() {}

        // MARK: Action Methods

        func onSignInPress() {
            guard let topMostController = UIViewController.topMostController else { return }
            Task {
                do {
                    let user = try await self.signInUseCase.execute(viewController: topMostController)
                    MassiveToast.makeToast(message: "Welcome \(user.name ?? "")")
                } catch {
                    MassiveToast.makeToast(message: error.localizedDescription)
                }
            }
        }

        #if DEBUG

            // MARK: Examples

            static var example1: ViewModel {
                let viewModel = ViewModel()
                return viewModel
            }
        #endif
    }
}
