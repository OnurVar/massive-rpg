//
//  HomeScreenViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

import Factory
import SwiftUI

extension HomeScreenView {
    class ViewModel: ObservableObject {
        // MARK: Variables

        @Injected(\.signOutUseCase) private var signOutUseCase

        // MARK: Life Cycle

        init() {}

        // MARK: Action Methods

        func onSignOutPress() {
            do {
                try signOutUseCase.execute()
                MassiveToast.makeToast(message: "Signed out")
            } catch {
                MassiveToast.makeToast(message: error.localizedDescription)
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
