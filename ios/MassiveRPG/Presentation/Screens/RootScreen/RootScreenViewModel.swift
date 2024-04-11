//
//  RootScreenViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 8.04.2024.
//

import Factory
import SwiftUI

extension RootScreenView {
    class ViewModel: ObservableObject {
        // MARK: Variables

        @Injected(\.registerSignedInUserPublisherUseCase) private var registerSignedInUserPublisherUseCase
        @Published var isSignedIn = false

        // MARK: Life Cycle

        init() {
            registerSignedInUserPublisherUseCase.execute()
                .map { $0 != nil }
                .assign(to: &$isSignedIn)
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
