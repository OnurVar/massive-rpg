//
//  CharacterDetailScreenViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import Factory
import SwiftUI

extension CharacterDetailScreenView {
    class ViewModel: ObservableObject {
        // MARK: Variables

        @Injected(\.getCharacterUseCase) private var getCharacterUseCase
        @Injected(\.deleteCharacterUseCase) private var deleteCharacterUseCase

        @Published var character: Character
        @Published var itemUpsertCharacterScreenModel: UpsertCharacterScreenView.Model? = nil
        @Published var isShowingDeleteConfirmation = false
        @Published var isLoadingDelete = false

        // MARK: Life Cycle

        init(character: Character) {
            self.character = character
        }

        func onAppear() {
            Task {
                await loadCharacter()
            }
        }

        // MARK: Methods

        func onEditPress() {
            itemUpsertCharacterScreenModel = .init(type: .Update(character: character))
        }

        func onDeletePress() {
            isShowingDeleteConfirmation.toggle()
        }

        func onCharacterChange() {
            Task {
                await loadCharacter()
            }
        }

        // MARK: Methods

        @MainActor
        func loadCharacter() async {
            guard let characterId = character.id else { return }

            let result = await getCharacterUseCase.execute(forId: characterId)
            await MainActor.run { [weak self] in
                guard let self else { return }
                switch result {
                case .success(let newCharacter):
                    self.character = newCharacter
                case .failure(let error):
                    MassiveToast.makeToast(message: error.localizedDescription)
                }
            }
        }

        func deleteCharacter(dismiss: @escaping () -> Void) {
            guard let characterId = character.id else { return }

            isLoadingDelete = true
            Task {
                let result = await deleteCharacterUseCase.execute(forId: characterId)
                await MainActor.run { [weak self] in
                    guard let self else { return }
                    switch result {
                    case .success:
                        self.isLoadingDelete = false
                        dismiss()
                    case .failure(let error):
                        MassiveToast.makeToast(message: error.localizedDescription)
                    }
                }
            }
        }

#if DEBUG

        // MARK: Examples

        static var example1: ViewModel {
            let viewModel = ViewModel(character: .example1)
            return viewModel
        }
#endif
    }
}
