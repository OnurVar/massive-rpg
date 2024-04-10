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
        @Injected(\.getCharacterListUseCase) private var getCharacterListUseCase

        @Published var resultCharacterList: Loadable<[Character]> = .empty
        @Published var itemUpsertCharacterScreenModel: UpsertCharacterScreenView.Model? = nil

        // MARK: Life Cycle

        init() {}

        func onAppear() {
            loadCharacterList()
        }

        // MARK: Action Methods

        func onPlusPress() {
            itemUpsertCharacterScreenModel = .init(type: .Create)
        }

        func onSignOutPress() {
            Task {
                let result = signOutUseCase.execute()
                switch result {
                case .success:
                    MassiveToast.makeToast(message: "Signed out")
                case .failure(let error):
                    MassiveToast.makeToast(message: error.localizedDescription)
                }
            }
        }

        // MARK: Methods

        func loadCharacterList() {
            resultCharacterList = .content(data: [], isLoading: true)

            Task {
                let result = await getCharacterListUseCase.execute()
                await MainActor.run { [weak self] in
                    guard let self else { return }
                    switch result {
                    case .success(let data):
                        guard !data.isEmpty else {
                            self.resultCharacterList = .empty
                            return
                        }
                        self.resultCharacterList = .content(data: data, isLoading: false)
                    case .failure(let error):
                        self.resultCharacterList = .failed(error: error)
                    }
                }
            }
        }

        #if DEBUG

            // MARK: Examples

            static var example1: ViewModel {
                let viewModel = ViewModel()
                viewModel.resultCharacterList = .content(data: [.example1, .example2, .example3, .example4, .example5], isLoading: false)
                return viewModel
            }

            static var example2: ViewModel {
                let viewModel = ViewModel()
                viewModel.resultCharacterList = .content(data: [], isLoading: true)
                return viewModel
            }

            static var example3: ViewModel {
                let viewModel = ViewModel()
                viewModel.resultCharacterList = .empty
                return viewModel
            }

            static var example4: ViewModel {
                let viewModel = ViewModel()
                viewModel.resultCharacterList = .failed(error: MassiveRPGAppError.SampleError)
                return viewModel
            }
        #endif
    }
}
