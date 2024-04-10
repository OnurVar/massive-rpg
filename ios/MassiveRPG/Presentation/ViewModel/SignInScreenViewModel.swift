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
                let result = await signInUseCase.execute(viewController: topMostController)
                await MainActor.run { [weak self] in
                    guard let self else { return }
                    switch result {
                    case .success(let user):
                        MassiveToast.makeToast(message: "Welcome \(user.name ?? "")")
                    case .failure(let error):
                        MassiveToast.makeToast(message: error.localizedDescription)
                    }
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
